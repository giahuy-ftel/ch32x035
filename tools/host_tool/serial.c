#include <glob.h>
#include <stdbool.h>
#include <sys/stat.h>
#include "serial.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>


static speed_t get_baud_speed(int baudrate) {
    switch (baudrate) {
        case 9600: return B9600;
        case 19200: return B19200;
        case 38400: return B38400;
        case 57600: return B57600;
        case 115200: return B115200;
        case 230400: return B230400;
        default: return B19200;
    }
}

int serial_read(int fd, uint8_t *buf, size_t count) {
    size_t total = 0;
    while (total < count) {
        ssize_t result = read(fd, buf + total, count - total);
        if (result < 0) {
            return -1;
        }
        if (result == 0) {
            break;
        }
        total += (size_t)result;
    }
    return (int)total;
}

int serial_write(int fd, const uint8_t *buf, size_t count) {
    size_t total = 0;
    while (total < count) {
        ssize_t result = write(fd, buf + total, count - total);
        if (result <= 0) {
            return -1;
        }
        total += (size_t)result;
    }
    return (int)total;
}

int serial_open(const char *portname, int baudrate) {
    int fd = open(portname, O_RDWR | O_NOCTTY | O_SYNC);
    if (fd < 0) {
        return -1;
    }

    struct termios tty;
    if (tcgetattr(fd, &tty) != 0) {
        close(fd);
        return -1;
    }

    speed_t speed = get_baud_speed(baudrate);
    cfsetospeed(&tty, speed);
    cfsetispeed(&tty, speed);

    tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;
    tty.c_iflag &= ~IGNBRK;
    tty.c_lflag = 0;
    tty.c_oflag = 0;
    tty.c_cc[VMIN] = 0;
    tty.c_cc[VTIME] = 50;
    tty.c_iflag &= ~(IXON | IXOFF | IXANY);
    tty.c_cflag |= (CLOCAL | CREAD);
    tty.c_cflag &= ~(PARENB | PARODD);
    tty.c_cflag &= ~CSTOPB;

    if (tcsetattr(fd, TCSANOW, &tty) != 0) {
        close(fd);
        return -1;
    }

    return fd;
}

void serial_close(int fd) {
    if (fd >= 0) {
        close(fd);
    }
}

static bool is_character_device(const char *path) {
    struct stat metadata;
    return stat(path, &metadata) == 0 && S_ISCHR(metadata.st_mode);
}
static char *copy_path(const char *path) {
    size_t length = strlen(path) + 1;
    char *copy = malloc(length);
    if (copy != NULL) {
        memcpy(copy, path, length);
    }
    return copy;
}

char *serial_detect_port(void) {
    static const char *const patterns[] = {
        "/dev/cu.wch*",
        "/dev/cu.WCH*",
        "/dev/tty.wch*",
        "/dev/tty.WCH*",
        "/dev/ttyWCH*",
        "/dev/cu.usbmodem*",
        "/dev/tty.usbmodem*",
        "/dev/cu.usbserial*",
        "/dev/tty.usbserial*",
        "/dev/ttyACM*",
        "/dev/ttyUSB*"
    };

    for (size_t i = 0; i < sizeof(patterns) / sizeof(patterns[0]); ++i) {
        glob_t matches;
        int result = glob(patterns[i], 0, NULL, &matches);
        if (result == 0) {
            for (size_t j = 0; j < matches.gl_pathc; ++j) {
                if (is_character_device(matches.gl_pathv[j])) {
                    char *path = copy_path(matches.gl_pathv[j]);
                    globfree(&matches);
                    return path;
                }
            }
        }
        globfree(&matches);
    }

    return NULL;
}