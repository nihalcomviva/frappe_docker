#!/bin/bash

# Log path inside Docker
LOG_PATH="/var/lib/docker/containers"

# 100MB in bytes
MAX_SIZE=$((100*1024*1024))

# Truncate large log files
find $LOG_PATH -name "*.log" -type f -size +$MAX_SIZEc -exec truncate -s 0 {} \;

echo "Log rotation done."
