#ifndef IMAGE_H
#define IMAGE_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

// Loads a .bin or .elf file, converts to .bin if necessary,
// pads the payload to a multiple of 256 bytes,
// prepends the 32-byte header, and calculates all CRCs.
// Returns a dynamically allocated buffer containing the final packaged image.
// Caller is responsible for free()ing the returned buffer.
uint8_t* build_image(const char* input_path, size_t* out_size);

#endif // IMAGE_H