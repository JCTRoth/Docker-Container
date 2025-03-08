#!/bin/bash

# Load configuration
source /config.env

# Timestamp format
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql.gz"

# Create a backup
mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" | gzip > "$BACKUP_FILE"

# Rotate backups: Keep only the latest MAX_BACKUPS files
ls -tp "$BACKUP_DIR"/backup_*.sql.gz | grep -v '/$' | tail -n +$((MAX_BACKUPS+1)) | xargs -I {} rm -- {}

echo "Backup created: $BACKUP_FILE"