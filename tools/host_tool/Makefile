CC      ?= gcc
CFLAGS  ?= -std=c11 -O2 -Wall -Wextra
LDFLAGS ?= 

TARGET  := host_tool
SRCS    := $(wildcard *.c)
OBJS    := $(SRCS:.c=.o)

.PHONY: all clean obj

all: $(TARGET)
	rm -f $(OBJS)

obj: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
