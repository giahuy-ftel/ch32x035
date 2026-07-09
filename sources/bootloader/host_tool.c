#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>

static int open_uart(const char *dev)
{
    int fd = open(dev, O_RDWR | O_NOCTTY);
    if(fd < 0)
    {
        perror("open");
        exit(1);
    }

    struct termios tty;

    tcgetattr(fd, &tty);

    cfmakeraw(&tty);

    cfsetispeed(&tty, B19200);
    cfsetospeed(&tty, B19200);

    tty.c_cflag |= CLOCAL | CREAD;
    tty.c_cflag &= ~PARENB;
    tty.c_cflag &= ~CSTOPB;
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;

    tty.c_cc[VMIN]  = 1;
    tty.c_cc[VTIME] = 0;

    tcsetattr(fd, TCSANOW, &tty);
    tcflush(fd, TCIOFLUSH);
    return fd;
}

static void read_exact(int fd, void *buf, size_t len)
{
    uint8_t *p = buf;

    while(len)
    {
        ssize_t r = read(fd, p, len);

        if(r < 0)
        {
            perror("read");
            exit(1);
        }

        if(r == 0)
            continue;

        p += r;
        len -= r;
    }
}

static void write_exact(int fd, const void *buf, size_t len)
{
    const uint8_t *p = buf;

    while(len)
    {
        ssize_t w = write(fd, p, len);

        if(w < 0)
        {
            perror("write");
            exit(1);
        }

        p += w;
        len -= w;
    }
}

uint32_t receive_word(int fd)
{
    uint8_t b[4];
    read_exact(fd, b, 4);
    printf("RX: %02X %02X %02X %02X\n",
           b[0], b[1], b[2], b[3]);
    uint32_t word;
    memcpy(&word, b, 4);
    return word;
}

static void send_word(int fd, uint32_t word)
{
    write_exact(fd, &word, 4);
}

int main(int argc,char **argv)
{
    if(argc != 3)
    {
        printf("usage:\n");
        printf("    %s /dev/ttyACM0 image.bin\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[2],"rb");
    if(!f)
    {
        perror("image");
        return 1;
    }

    fseek(f,0,SEEK_END);
    uint32_t image_size = ftell(f);
    rewind(f);

    uint8_t *image = malloc(image_size);

    if(!image)
    {
        printf("malloc failed\n");
        return 1;
    }

    fread(image,1,image_size,f);
    fclose(f);

    int fd = open_uart(argv[1]);

    printf("Waiting for MCU...\n");

    while(1)
    {
        uint32_t offset = receive_word(fd);

        if(offset == 0xFFFFFFFF)
        {
            printf("Firmware update successful.\n");
            break;
        }

        if(offset == 0xDEADBEEF)
        {
            printf("MCU reported CRC/header error.\n");
            break;
        }

        printf("MCU requested offset 0x%08X\n", offset);

        if(offset + 4 <= image_size)
        {
            write_exact(fd, image + offset, 4);
        }
        else
        {
            uint32_t blank = 0xFFFFFFFF;
            send_word(fd, blank);
        }
    }

    close(fd);
    free(image);

    return 0;
}