#!/bin/bash

# Memory usage
MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
MEM_THRESHOLD=80
echo "Memory Usage: $MEM_USAGE%"

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "High Memory usage: $MEM_USAGE%" >> /var/log/sre_mem_alert.log
fi

# Disk usage
DISK_THRESHOLD=80
df -h | grep '^/dev/' | while read line; do
  USAGE=$(echo $line | awk '{print int($5)}')
  MOUNT=$(echo $line | awk '{print $6}')
  if [ $USAGE -gt $DISK_THRESHOLD ]; then
    echo "High Disk usage on $MOUNT: $USAGE%" >> /var/log/sre_disk_alert.log
  fi
done
