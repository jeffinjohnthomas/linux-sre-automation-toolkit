#!/bin/bash

# Service Health Monitoring Script
# Author: Jeffin John Thomas
# Purpose: Monitor status of critical services for Linux SRE Automation Toolkit

# Set directories
LOG_DIR="../logs"
DATE=$(date +%F_%H-%M-%S)
LOG_FILE="$LOG_DIR/service_health_$DATE.log"

# Create log directory if it doesn't exist
mkdir -p $LOG_DIR

echo "Starting service health check at $(date)" | tee -a $LOG_FILE

# List of services to monitor
SERVICES=("cron" "ssh")

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running" | tee -a $LOG_FILE
    else
        echo "$SERVICE is NOT running" | tee -a $LOG_FILE
    fi
done

echo "Service health check completed at $(date)" | tee -a $LOG_FILE

