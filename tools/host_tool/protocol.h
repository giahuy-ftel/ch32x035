#ifndef PROTOCOL_H
#define PROTOCOL_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

// Run the bootloader protocol over a POSIX serial file descriptor.
int protocol_run(int serial_fd, const uint8_t *image, size_t image_size);

#endif // PROTOCOL_H
