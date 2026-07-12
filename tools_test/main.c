#include "image.h"
#include "log.h"
#include "serial.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <errno.h>

#define TOOL_NAME    "boottool"
#define TOOL_VERSION "0.1.0"

/*=============================================================================
 * Shared helpers
 *===========================================================================*/

static int parse_u32(const char *str, uint32_t *out)
{
    char *end = NULL;
    errno = 0;
    unsigned long v = strtoul(str, &end, 0); /* base 0: accepts "0x..." or decimal */
    if (errno != 0 || end == str || *end != '\0')
    {
        return 0;
    }
    *out = (uint32_t)v;
    return 1;
}

static int parse_u16(const char *str, uint16_t *out)
{
    uint32_t v;
    if (!parse_u32(str, &v) || v > 0xFFFFu)
    {
        return 0;
    }
    *out = (uint16_t)v;
    return 1;
}

static long file_size(FILE *f)
{
    if (fseek(f, 0, SEEK_END) != 0) return -1;
    long size = ftell(f);
    if (size < 0) return -1;
    if (fseek(f, 0, SEEK_SET) != 0) return -1;
    return size;
}

/*=============================================================================
 * make-image
 *===========================================================================*/

static void make_image_usage(void)
{
    printf("Usage: %s make-image --input <file.bin> --output <file.img> [options]\n\n", TOOL_NAME);
    printf("Builds a header+payload firmware image for the custom UART bootloader.\n\n");
    printf("Required:\n");
    printf("  --input <path>          Raw application binary (payload)\n");
    printf("  --output <path>         Output image path (header + payload)\n\n");
    printf("Options:\n");
    printf("  --flash-addr <hex>      Target flash address (default: 0x00002000)\n");
    printf("  --entry-point <hex>     App entry point (default: same as --flash-addr)\n");
    printf("  --app-version <n>       Application version field (default: 0)\n");
    printf("  --crc-bypass            Set crc_bypass=1 (bootloader skips payload CRC check)\n");
    printf("  --header-version <n>    Header format version field (default: 1)\n");
    printf("  -h, --help              Show this help message\n\n");
    printf("Example:\n");
    printf("  %s make-image --input app.bin --output app.img \\\n", TOOL_NAME);
    printf("      --flash-addr 0x00002000 --entry-point 0x00002000\n");
}

static int cmd_make_image(int argc, char **argv)
{
    const char *input_path = NULL;
    const char *output_path = NULL;
    uint32_t flash_addr = 0x00002000u;
    uint32_t entry_point = 0xFFFFFFFFu; /* sentinel: "not explicitly set" */
    uint16_t app_version = 0;
    uint16_t header_version = IMAGE_VERSION_SUPPORTED;
    int crc_bypass = 0;

    static struct option long_opts[] = {
        {"input",          required_argument, 0, 'i'},
        {"output",         required_argument, 0, 'o'},
        {"flash-addr",     required_argument, 0, 'f'},
        {"entry-point",    required_argument, 0, 'e'},
        {"app-version",    required_argument, 0, 'a'},
        {"header-version", required_argument, 0, 'r'},
        {"crc-bypass",     no_argument,       0, 'c'},
        {"help",           no_argument,       0, 'h'},
        {0, 0, 0, 0}
    };

    int opt;
    while ((opt = getopt_long(argc, argv, "h", long_opts, NULL)) != -1)
    {
        switch (opt)
        {
            case 'i': input_path = optarg; break;
            case 'o': output_path = optarg; break;
            case 'f':
                if (!parse_u32(optarg, &flash_addr)) { log_error("invalid --flash-addr '%s'", optarg); return 1; }
                break;
            case 'e':
                if (!parse_u32(optarg, &entry_point)) { log_error("invalid --entry-point '%s'", optarg); return 1; }
                break;
            case 'a':
                if (!parse_u16(optarg, &app_version)) { log_error("invalid --app-version '%s'", optarg); return 1; }
                break;
            case 'r':
                if (!parse_u16(optarg, &header_version)) { log_error("invalid --header-version '%s'", optarg); return 1; }
                break;
            case 'c': crc_bypass = 1; break;
            case 'h': make_image_usage(); return 0;
            default:  make_image_usage(); return 1;
        }
    }

    if (input_path == NULL || output_path == NULL)
    {
        log_error("--input and --output are both required");
        make_image_usage();
        return 1;
    }

    if (entry_point == 0xFFFFFFFFu)
    {
        entry_point = flash_addr; /* default: entry_point == flash_addr for this RISC-V core */
    }

    FILE *in = fopen(input_path, "rb");
    if (in == NULL)
    {
        log_error("could not open input file '%s': %s", input_path, strerror(errno));
        return 1;
    }

    long raw_size = file_size(in);
    if (raw_size < 0)
    {
        log_error("could not determine size of '%s'", input_path);
        fclose(in);
        return 1;
    }
    if (raw_size == 0)
    {
        log_error("input file '%s' is empty", input_path);
        fclose(in);
        return 1;
    }

    /* Payload must be a multiple of 4 bytes; pad with 0xFF (flash-erased
       value) if the raw binary doesn't land on a word boundary. */
    uint32_t payload_size = (uint32_t)raw_size;
    uint32_t padded_size = (payload_size + 3u) & ~3u;

    uint8_t *payload = (uint8_t *)malloc(padded_size);
    if (payload == NULL)
    {
        log_error("out of memory allocating %u bytes", padded_size);
        fclose(in);
        return 1;
    }
    memset(payload, 0xFF, padded_size);

    if (fread(payload, 1, (size_t)raw_size, in) != (size_t)raw_size)
    {
        log_error("short read on '%s'", input_path);
        fclose(in);
        free(payload);
        return 1;
    }
    fclose(in);

    if (padded_size != payload_size)
    {
        log_warn("payload size %u is not a multiple of 4; padded to %u bytes with 0xFF",
                  payload_size, padded_size);
    }
    payload_size = padded_size;

    if (entry_point < flash_addr || entry_point >= flash_addr + payload_size)
    {
        log_error("--entry-point (0x%08X) is outside [flash-addr, flash-addr+payload_size) = [0x%08X, 0x%08X)",
                   entry_point, flash_addr, flash_addr + payload_size);
        free(payload);
        return 1;
    }
    if ((entry_point % 2u) != 0u)
    {
        log_error("--entry-point (0x%08X) must be 2-byte aligned", entry_point);
        free(payload);
        return 1;
    }
    if ((flash_addr % 256u) != 0u)
    {
        log_error("--flash-addr (0x%08X) must be 256-byte aligned (bootloader program-page size)", flash_addr);
        free(payload);
        return 1;
    }

    ImageHeader hdr;
    hdr.magic        = IMAGE_HEADER_MAGIC;
    hdr.version       = header_version;
    hdr.header_size  = IMAGE_HEADER_SIZE;
    hdr.payload_size = payload_size;
    hdr.flash_addr   = flash_addr;
    hdr.entry_point  = entry_point;
    hdr.app_version  = app_version;
    hdr.crc_bypass   = (uint16_t)crc_bypass;
    hdr.header_crc   = 0; /* filled below */
    hdr.payload_crc  = crc32_calculate(payload, payload_size);

    uint8_t header_bytes[IMAGE_HEADER_SIZE];
    image_header_serialize(&hdr, header_bytes);
    hdr.header_crc = crc32_calculate(header_bytes, 24); /* CRC covers bytes [0..23], excludes both CRC fields */
    image_header_serialize(&hdr, header_bytes);          /* re-serialize with header_crc filled in */

    FILE *out = fopen(output_path, "wb");
    if (out == NULL)
    {
        log_error("could not open output file '%s': %s", output_path, strerror(errno));
        free(payload);
        return 1;
    }

    if (fwrite(header_bytes, 1, IMAGE_HEADER_SIZE, out) != IMAGE_HEADER_SIZE ||
        fwrite(payload, 1, payload_size, out) != payload_size)
    {
        log_error("short write on '%s'", output_path);
        fclose(out);
        free(payload);
        return 1;
    }
    fclose(out);
    free(payload);

    log_info("image written: %s", output_path);
    log_info("  magic=0x%08X version=%u header_size=%u", hdr.magic, hdr.version, hdr.header_size);
    log_info("  payload_size=%u (0x%X)", hdr.payload_size, hdr.payload_size);
    log_info("  flash_addr=0x%08X entry_point=0x%08X", hdr.flash_addr, hdr.entry_point);
    log_info("  app_version=%u crc_bypass=%u", hdr.app_version, hdr.crc_bypass);
    log_info("  header_crc=0x%08X payload_crc=0x%08X", hdr.header_crc, hdr.payload_crc);
    log_info("  total image size=%u bytes", IMAGE_HEADER_SIZE + hdr.payload_size);

    return 0;
}

/*=============================================================================
 * serve
 *===========================================================================*/

static void serve_usage(void)
{
    printf("Usage: %s serve <device> <image.img> [options]\n\n", TOOL_NAME);
    printf("Acts as the PC-side responder for the bootloader's UART pull protocol:\n");
    printf("waits for the MCU to request 4-byte offsets and replies with the matching\n");
    printf("bytes from <image.img>, until the 0xFFFFFFFF DONE sentinel is received.\n\n");
    printf("Options:\n");
    printf("      --baudrate <baud>   UART baudrate: 9600, 19200, 38400, 57600, 115200,\n");
    printf("                          230400, 460800, 921600 (default: 19200)\n");
    printf("      --log-level <level> Log level: none, error, warn, info, debug (default: info)\n");
    printf("      --log-file <path>   Append logs to file (default: disabled)\n");
    printf("      --dry-run           Validate inputs and tty access without serving\n");
    printf("      --frame-debug       Print raw TX/RX frames\n");
    printf("  -h, --help              Show this help message\n\n");
    printf("Example:\n");
    printf("  %s serve /dev/ttyUSB0 app.img --baudrate 19200\n", TOOL_NAME);
}

static void print_frame(const char *dir, const uint8_t *buf, size_t len)
{
    printf("  %s:", dir);
    for (size_t i = 0; i < len; i++)
    {
        printf(" %02X", buf[i]);
    }
    printf("\n");
}

static int cmd_serve(int argc, char **argv)
{
    int baudrate = 19200;
    LogLevel level = LOG_INFO;
    const char *log_file = NULL;
    int dry_run = 0;
    int frame_debug = 0;

    static struct option long_opts[] = {
        {"baudrate",    required_argument, 0, 'b'},
        {"log-level",   required_argument, 0, 'l'},
        {"log-file",    required_argument, 0, 'g'},
        {"dry-run",     no_argument,       0, 'd'},
        {"frame-debug", no_argument,       0, 'x'},
        {"help",        no_argument,       0, 'h'},
        {0, 0, 0, 0}
    };

    int opt;
    while ((opt = getopt_long(argc, argv, "h", long_opts, NULL)) != -1)
    {
        switch (opt)
        {
            case 'b': baudrate = atoi(optarg); break;
            case 'l':
                if (!log_level_from_string(optarg, &level))
                {
                    fprintf(stderr, "invalid --log-level '%s'\n", optarg);
                    return 1;
                }
                break;
            case 'g': log_file = optarg; break;
            case 'd': dry_run = 1; break;
            case 'x': frame_debug = 1; break;
            case 'h': serve_usage(); return 0;
            default:  serve_usage(); return 1;
        }
    }

    if (optind + 2 > argc)
    {
        fprintf(stderr, "error: <device> and <image.img> are both required\n\n");
        serve_usage();
        return 1;
    }

    const char *device_path = argv[optind];
    const char *image_path = argv[optind + 1];

    log_init(level, log_file);

    FILE *img_f = fopen(image_path, "rb");
    if (img_f == NULL)
    {
        log_error("could not open image '%s': %s", image_path, strerror(errno));
        return 1;
    }
    long img_size = file_size(img_f);
    if (img_size <= 0)
    {
        log_error("could not determine size of '%s', or file is empty", image_path);
        fclose(img_f);
        return 1;
    }

    uint8_t *image = (uint8_t *)malloc((size_t)img_size);
    if (image == NULL)
    {
        log_error("out of memory allocating %ld bytes for image", img_size);
        fclose(img_f);
        return 1;
    }
    if (fread(image, 1, (size_t)img_size, img_f) != (size_t)img_size)
    {
        log_error("short read on '%s'", image_path);
        fclose(img_f);
        free(image);
        return 1;
    }
    fclose(img_f);

    log_info("loaded image '%s' (%ld bytes)", image_path, img_size);

    int fd = serial_open(device_path, baudrate);
    if (fd < 0)
    {
        free(image);
        return 1;
    }
    log_info("opened '%s' at %d baud, 8N1", device_path, baudrate);

    if (dry_run)
    {
        log_info("--dry-run: inputs and tty access validated OK, not serving");
        serial_close(fd);
        free(image);
        log_close();
        return 0;
    }

    log_info("waiting for MCU requests... (Ctrl-C to abort)");

    uint32_t request_count = 0;
    for (;;)
    {
        uint8_t offset_bytes[4];
        if (!serial_read_exact(fd, offset_bytes, 4))
        {
            serial_close(fd);
            free(image);
            log_close();
            return 1;
        }
        if (frame_debug)
        {
            print_frame("RX offset", offset_bytes, 4);
        }

        uint32_t offset = (uint32_t)offset_bytes[0]
                         | ((uint32_t)offset_bytes[1] << 8)
                         | ((uint32_t)offset_bytes[2] << 16)
                         | ((uint32_t)offset_bytes[3] << 24);

        
        if (offset == 0xFFFFFFFFu)
        {
            log_info("DONE sentinel received after %u requests, exiting cleanly", request_count);
            break;
        }

        uint8_t reply[4];
        if ((uint64_t)offset + 4u <= (uint64_t)img_size)
        {
            memcpy(reply, image + offset, 4);
        }
        else
        {
            log_error("offset 0x%08X out of range (image size %ld) - replying with 0xFF filler",
                       offset, img_size);
            memset(reply, 0xFF, 4);
        }

        if (!serial_write_exact(fd, reply, 4))
        {
            serial_close(fd);
            free(image);
            log_close();
            return 1;
        }
        if (frame_debug)
        {
            print_frame("TX data  ", reply, 4);
        }

        request_count++;
        if (level >= LOG_DEBUG)
        {
            log_debug("offset=0x%08X -> %02X %02X %02X %02X", offset,
                       reply[0], reply[1], reply[2], reply[3]);
        }
        else if (request_count % 64 == 0)
        {
            log_info("...%u requests served", request_count);
        }
    }

    serial_close(fd);
    free(image);
    log_close();
    return 0;
}

/*=============================================================================
 * Top-level dispatch
 *===========================================================================*/

static void top_level_usage(void)
{
    printf("Usage: %s <command> [options]\n\n", TOOL_NAME);
    printf("Commands:\n");
    printf("  make-image   Build a header+payload firmware image from a raw binary\n");
    printf("  serve        Act as the PC-side host for the bootloader's UART pull protocol\n\n");
    printf("Run '%s <command> --help' for command-specific options.\n\n", TOOL_NAME);
    printf("  -h, --help      Show this help message\n");
    printf("  -v, --version   Show version information\n");
}

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        top_level_usage();
        return 1;
    }

    if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0)
    {
        top_level_usage();
        return 0;
    }
    if (strcmp(argv[1], "-v") == 0 || strcmp(argv[1], "--version") == 0)
    {
        printf("%s %s\n", TOOL_NAME, TOOL_VERSION);
        printf("build: %s %s\n", __DATE__, __TIME__);
        return 0;
    }

    /* Reslice argv so getopt_long inside each subcommand sees argv[0] as
       "boottool <subcommand>" and options starting at index 1, matching
       normal getopt conventions. */
    int sub_argc = argc - 1;
    char **sub_argv = &argv[1];

    if (strcmp(argv[1], "make-image") == 0)
    {
        log_init(LOG_INFO, NULL);
        int rc = cmd_make_image(sub_argc, sub_argv);
        log_close();
        return rc;
    }
    if (strcmp(argv[1], "serve") == 0)
    {
        return cmd_serve(sub_argc, sub_argv);
    }

    fprintf(stderr, "error: unknown command '%s'\n\n", argv[1]);
    top_level_usage();
    return 1;
}