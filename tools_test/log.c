#include "log.h"
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>

static LogLevel g_level = LOG_INFO;
static FILE *g_log_file = NULL;

int log_level_from_string(const char *str, LogLevel *out)
{
    if (strcmp(str, "none") == 0)  { *out = LOG_NONE;  return 1; }
    if (strcmp(str, "error") == 0) { *out = LOG_ERROR; return 1; }
    if (strcmp(str, "warn") == 0)  { *out = LOG_WARN;  return 1; }
    if (strcmp(str, "info") == 0)  { *out = LOG_INFO;  return 1; }
    if (strcmp(str, "debug") == 0) { *out = LOG_DEBUG; return 1; }
    return 0;
}

void log_init(LogLevel level, const char *log_file_path)
{
    g_level = level;
    if (log_file_path != NULL)
    {
        g_log_file = fopen(log_file_path, "a");
        if (g_log_file == NULL)
        {
            fprintf(stderr, "warning: could not open log file '%s' for append\n", log_file_path);
        }
    }
}

void log_close(void)
{
    if (g_log_file != NULL)
    {
        fclose(g_log_file);
        g_log_file = NULL;
    }
}

static void log_write(LogLevel level, const char *tag, const char *fmt, va_list args)
{
    if (level > g_level)
    {
        return;
    }

    char timebuf[32];
    time_t now = time(NULL);
    struct tm tm_now;
    localtime_r(&now, &tm_now);
    strftime(timebuf, sizeof(timebuf), "%H:%M:%S", &tm_now);

    va_list args_copy;
    va_copy(args_copy, args);

    fprintf(stderr, "[%s] %-5s ", timebuf, tag);
    vfprintf(stderr, fmt, args);
    fprintf(stderr, "\n");

    if (g_log_file != NULL)
    {
        fprintf(g_log_file, "[%s] %-5s ", timebuf, tag);
        vfprintf(g_log_file, fmt, args_copy);
        fprintf(g_log_file, "\n");
        fflush(g_log_file);
    }

    va_end(args_copy);
}

void log_error(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    log_write(LOG_ERROR, "ERROR", fmt, args);
    va_end(args);
}

void log_warn(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    log_write(LOG_WARN, "WARN", fmt, args);
    va_end(args);
}

void log_info(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    log_write(LOG_INFO, "INFO", fmt, args);
    va_end(args);
}

void log_debug(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    log_write(LOG_DEBUG, "DEBUG", fmt, args);
    va_end(args);
}