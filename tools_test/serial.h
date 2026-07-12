#ifndef BOOTTOOL_SERIAL_H
#define BOOTTOOL_SERIAL_H

#include <stddef.h>
#include <stdint.h>

/* Opens and configures the serial device for raw 8N1, no flow control,
   at the given baud rate. Returns fd >= 0 on success, -1 on failure
   (error already logged). Supported bauds match ak-flash's list:
   9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600. */
int serial_open(const char *device_path, int baudrate);

void serial_close(int fd);

/* Blocking read/write of exactly `len` bytes, retrying on EINTR/short
   reads/writes. Returns 1 on success, 0 on error or EOF (error logged). */
int serial_read_exact(int fd, uint8_t *buf, size_t len);
int serial_write_exact(int fd, const uint8_t *buf, size_t len);

#endif