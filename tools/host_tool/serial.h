#ifndef SERIAL_H
#define SERIAL_H

#include <stddef.h>
#include <stdint.h>

// Opens the POSIX serial port and returns its file descriptor.
// Returns -1 on error.
int serial_open(const char *portname, int baudrate);
// Reads until count bytes arrive or the configured serial timeout expires.
int serial_read(int fd, uint8_t *buf, size_t count);

// Writes all requested bytes or returns -1 on error.
int serial_write(int fd, const uint8_t *buf, size_t count);
// Finds a likely WCH-Link serial device without external dependencies.
// The returned path is heap allocated and must be released with free().
char *serial_detect_port(void);

// Closes a serial file descriptor.
void serial_close(int fd);

#endif // SERIAL_H