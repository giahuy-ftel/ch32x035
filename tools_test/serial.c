#include "serial.h"
#include "log.h"

#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

static int baud_to_speed(int baudrate, speed_t *out)
{
    switch (baudrate)
    {
        case 9600:   *out = B9600;   return 1;
        case 19200:  *out = B19200;  return 1;
        case 38400:  *out = B38400;  return 1;
        case 57600:  *out = B57600;  return 1;
        case 115200: *out = B115200; return 1;
        case 230400: *out = B230400; return 1;
        case 460800: *out = B460800; return 1;
        case 921600: *out = B921600; return 1;
        default:     return 0;
    }
}

int serial_open(const char *device_path, int baudrate)
{
    speed_t speed;
    if (!baud_to_speed(baudrate, &speed))
    {
        log_error("unsupported baud rate %d (supported: 9600, 19200, 38400, "
                  "57600, 115200, 230400, 460800, 921600)", baudrate);
        return -1;
    }

    int fd = open(device_path, O_RDWR | O_NOCTTY);
    if (fd < 0)
    {
        log_error("could not open '%s': %s", device_path, strerror(errno));
        return -1;
    }

    struct termios tty;
    if (tcgetattr(fd, &tty) != 0)
    {
        log_error("tcgetattr('%s') failed: %s", device_path, strerror(errno));
        close(fd);
        return -1;
    }

    cfmakeraw(&tty);              /* no echo, no signals, no line buffering */
    cfsetispeed(&tty, speed);
    cfsetospeed(&tty, speed);

    tty.c_cflag &= ~PARENB;       /* no parity */
    tty.c_cflag &= ~CSTOPB;       /* 1 stop bit */
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;           /* 8 data bits */
    tty.c_cflag &= ~CRTSCTS;      /* no hardware flow control */
    tty.c_cflag |= (CLOCAL | CREAD);

    /* Blocking reads: return as soon as >=1 byte is available, no timeout.
       serial_read_exact() below loops to accumulate exactly `len` bytes. */
    tty.c_cc[VMIN]  = 1;
    tty.c_cc[VTIME] = 0;

    if (tcsetattr(fd, TCSANOW, &tty) != 0)
    {
        log_error("tcsetattr('%s') failed: %s", device_path, strerror(errno));
        close(fd);
        return -1;
    }

    tcflush(fd, TCIOFLUSH);

    return fd;
}

void serial_close(int fd)
{
    if (fd >= 0)
    {
        close(fd);
    }
}

int serial_read_exact(int fd, uint8_t *buf, size_t len)
{
    size_t got = 0;
    while (got < len)
    {
        ssize_t n = read(fd, buf + got, len - got);
        if (n < 0)
        {
            if (errno == EINTR)
            {
                continue;
            }
            log_error("serial read failed: %s", strerror(errno));
            return 0;
        }
        if (n == 0)
        {
            log_error("serial read returned EOF (device disconnected?)");
            return 0;
        }
        got += (size_t)n;
    }
    return 1;
}

int serial_write_exact(int fd, const uint8_t *buf, size_t len)
{
    size_t sent = 0;
    while (sent < len)
    {
        ssize_t n = write(fd, buf + sent, len - sent);
        if (n < 0)
        {
            if (errno == EINTR)
            {
                continue;
            }
            log_error("serial write failed: %s", strerror(errno));
            return 0;
        }
        sent += (size_t)n;
    }
    return 1;
}