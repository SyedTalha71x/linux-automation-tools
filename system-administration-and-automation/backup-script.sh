#!/bin/bash

# -----------------------------
#  Automated Backup Script
#  Author: Talha
# -----------------------------

# Usage:
#   ./backup_script.sh <source_directory> <backup_destination>
#

# Example:
#   ./backup_script.sh /var/www /backups
#

# Features:
# Creates compressed tar.gz backups
# Includes timestamp in filename
# Deletes backups older than 7 days
# Can be scheduled with cron
# -----------------------------

# Exit on error
set -e

# check argument 
if [ $# -ne 2 ]; then
   echo "Usage: $0 <source_directory> <backup_destination>"
   exit 1
fi

SOURCE_DIR=$1
BACKUP_DIR=$2
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz"

# ensure backup directory exists
sudo mkdir -p "$BACKUP_DIR"

echo "Creating backup of $SOURCE_DIR to $BACKUP_FILE"
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" "$(basename "$SOURCE_DIR")"

echo "Backup created successfully."

# Delete backups older than 7 days
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Old backups deleted successfully."