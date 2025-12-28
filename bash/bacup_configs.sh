#!/bin/bash

SRC_DIRS=("/etc" "/var/www/html")
BACKUP_DIR="/home/$(whoami)/sre_backups"
DATE=$(date +%F)

mkdir -p $BACKUP_DIR

for dir in "${SRC_DIRS[@]}"; do
  tar -czf $BACKUP_DIR/$(basename $dir)_$DATE.tar.gz $dir
done

echo "Backup completed on $DATE" >> /var/log/sre_backup.log
