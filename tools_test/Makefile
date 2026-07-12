
CC      = gcc
CFLAGS  = -std=c11 -D_DEFAULT_SOURCE -Wall -Wextra -O2
TARGET  = boottool
SOURCES = main.c image.c log.c serial.c
OBJECTS = $(SOURCES:.c=.o)
 
.PHONY: all clean
 
all: $(TARGET)
 
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $(OBJECTS)
 
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<
 
clean:
	rm -f $(OBJECTS) $(TARGET)
 