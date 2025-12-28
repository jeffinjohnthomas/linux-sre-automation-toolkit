#!/bin/bash

# Threshold (percentage)
THRESHOLD=75

# Get current CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')

echo "Current CPU Usage: $CPU_USAGE%"

if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
  echo "Warning: CPU usage is above $THRESHOLD%" >> /var/log/sre_cpu_alert.log
fi
