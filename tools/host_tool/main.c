#include <stdio.h>

void print_usage();
void print_help();

int main(int argc, char *argv[]) {
   if (argc < 2) {
      print_usage();
      return 0;
   }

   return 0;
}

void print_usage() {
   printf("Usage: host_tool [OPTIONS] <firmware.elf | firmware.bin>\n\n");
   printf("Options:\n");
   printf("      -h, --help         Show this help message and exit\n");
   printf("      -p, --port PORT    Specify the serial port (e.g., /dev/cu.usbmodem1234)\n");
   printf("                         If not provided, the tool will attempt to auto - detect.\n");
   printf("      -b, --baud BAUD    Baud rate(default : 19200)\n");
   printf("      --dry-run          Process the firmware, print the header info, and optionally\n");
   printf("                         save the final padded image to a file without "
          "flashing.\n");
}

void print_help() {
}
