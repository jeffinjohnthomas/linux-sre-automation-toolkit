#!/bin/bash

LOG_DIR="/var/log"
DAYS=7

echo "Cleaning logs older than $DAYS days in $LOG_DIR"
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

echo "Log cleanup done" >> /var/log/sre_log_cleanup.log
