#!/bin/bash

# Backup Configurations Script
# Author: Jeffin John Thomas
# Purpose: Backup critical system configuration files for Linux SRE Automation Toolkit

# Set directories
BACKUP_DIR="../backups"
LOG_DIR="../logs"
DATE=$(date +%F_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/etc_backup_$DATE.tar.gz"
LOG_FILE="$LOG_DIR/backup_log_$DATE.log"

# Create necessary directories if they don't exist
mkdir -p $BACKUP_DIR
mkdir -p $LOG_DIR

echo "Starting backup of /etc at $(date)" | tee -a $LOG_FILE

# Run backup using sudo for permissioned files
if sudo tar -czvf $BACKUP_FILE /etc 2>> $LOG_FILE; then
    echo "Backup completed successfully for /etc" | tee -a $LOG_FILE
else
    echo "Backup completed with some errors. Check $LOG_FILE for details." | tee -a $LOG_FILE
fi

# Optional: list backup file
echo "Backup file created: $BACKUP_FILE" | tee -a $LOG_FILE

