#ifndef BOOTTOOL_LOG_H
#define BOOTTOOL_LOG_H

typedef enum
{
    LOG_NONE = 0,
    LOG_ERROR,
    LOG_WARN,
    LOG_INFO,
    LOG_DEBUG
} LogLevel;

/* Parses "none"/"error"/"warn"/"info"/"debug". Returns 1 on success. */
int log_level_from_string(const char *str, LogLevel *out);

void log_init(LogLevel level, const char *log_file_path); /* log_file_path may be NULL */
void log_close(void);

void log_error(const char *fmt, ...);
void log_warn(const char *fmt, ...);
void log_info(const char *fmt, ...);
void log_debug(const char *fmt, ...);

#endif