#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include <string.h>
#include "image.h"
#include "protocol.h"
#include "serial.h"

void print_usage();

int main(int argc, char *argv[]) {
   if (argc < 2) {
      print_usage();
      return 1;
   }

   char *port_name = NULL;
   char *output_path = NULL;
   int baud = 19200;
   bool dry_run = false;
   int option;

   // last element must be 0 (as per the getopt_long doc)
   struct option long_options[] = {{"help", no_argument, 0, 'h'},         {"port", required_argument, 0, 'p'},
                                   {"baud", required_argument, 0, 'b'},   {"dry-run", no_argument, 0, 'd'},
                                   {"output", required_argument, 0, 'o'}, {0, 0, 0, 0}};

   char *endptr;

   while ((option = getopt_long(argc, argv, "hp:b:do:", long_options, NULL)) != -1) {
      switch (option) {
      case 'h':
         print_usage();
         return 0;
      case 'p':
         port_name = optarg;
         break;
      case 'b':
         baud = (int)strtoll(optarg, &endptr, 10);
         if (endptr == optarg) {
            printf("Error: Baud rate should be an integer.\n");
            return 1;
         }
         break;
      case 'd':
         dry_run = true;
         break;
      case 'o':
         output_path = optarg;
         break;
      default:
         print_usage();
         return 1;
      }
   }

   if (optind != argc - 1) {
      printf("Error: Missing input .bin/.elf or too many arguments\n");
      print_usage();
      return 1;
   }

   const char *input_path = argv[optind];

   size_t image_size = 0;
   uint8_t *image_data = build_image(input_path, &image_size);
   if (!image_data) {
      return 1;
   }

   if (dry_run) {
      printf("Dry run mode: image built successfully.\n");
      char default_out[1024];
      if (!output_path) {
         // extract stem
         const char *dot = strrchr(input_path, '.');
         if (dot) {
            int len = dot - input_path;
            snprintf(default_out, sizeof(default_out), "%.*s.packaged.bin", len, input_path);
         } else {
            snprintf(default_out, sizeof(default_out), "%s.packaged.bin", input_path);
         }
         output_path = default_out;
      }

      FILE *out = fopen(output_path, "wb");
      if (out) {
         fwrite(image_data, 1, image_size, out);
         fclose(out);
         printf("Wrote %zu bytes to %s\n", image_size, output_path);
      } else {
         printf("Error: Could not open %s for writing\n", output_path);
      }
   } else {
      char *detected_port = NULL;
      const char *selected_port = port_name;

      // attempt to auto-detect
      if (selected_port == NULL) {
         detected_port = serial_detect_port();
         if (detected_port == NULL) {
            printf("Error: Could not auto-detect a WCH-Link serial port.\n");
            printf("Please specify one manually using --port.\n");
            free(image_data);
            return 1;
         }
         selected_port = detected_port;
         printf("Auto-detected port: %s\n", selected_port);
      }

      printf("Connecting to %s at %d baud...\n", selected_port, baud);
      int serial_fd = serial_open(selected_port, baud);
      if (serial_fd < 0) {
         printf("Error: Failed to open port %s.\n", selected_port);
         free(detected_port);
         free(image_data);
         return 1;
      }

      int res = protocol_run(serial_fd, image_data, image_size);
      serial_close(serial_fd);
      free(detected_port);

      if (res != 0) {
         printf("Firmware update failed.\n");
      }
   }
   free(image_data);
   return 0;
}

void print_usage() {
   printf("Usage: host_tool [OPTIONS] <firmware.elf | firmware.bin>\n\n");
   printf("Options:\n");
   printf("      -h, --help         Show this help message and exit\n");
   printf("      -p, --port PORT    Specify the serial port (e.g., /dev/cu.usbmodem1234)\n");
   printf("                         If not provided, the tool will auto-detect a likely WCH-Link port.\n");
   printf("      -b, --baud BAUD    Baud rate (default: 19200)\n");
   printf("      -d, --dry-run      Process the firmware, print the header info, and optionally\n");
   printf("                         save the final padded image to a file without flashing.\n");
   printf("      -o, --output PATH  Overrides the default output path for --dry-run\n");
}
