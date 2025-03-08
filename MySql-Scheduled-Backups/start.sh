#!/bin/bash

# Load configuration
source /config.env

# Ensure cron jobs directory exists
mkdir -p /var/spool/cron/crontabs

# Write the cron job using the configured schedule
echo "$CRON_SCHEDULE /backup.sh >> /var/log/cron.log 2>&1" > /etc/crontabs/root

# Start cron in foreground mode
crond -f -l 2