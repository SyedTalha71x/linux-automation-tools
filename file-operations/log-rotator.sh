#!/bin/bash

# --------------------------------------------
# Log Rotator Script
# Author: Talha
# --------------------------------------------

LOGFILE="./fake.logs"
RETENTION_DAYS=7

rotate_logs(){
    if [ ! -f $LOGFILE ]; then
        echo "$LOGFILE not found"
        exit 1
    fi

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    ROTATED_LOG="${LOGFILE%.*}_$TIMESTAMP.log"

    echo "Rotating log file: $LOGFILE to $ROTATED_LOG"
    mv "$LOGFILE" "$ROTATED_LOG"
    touch "$LOGFILE"
    echo "Log file rotated successfully."

    echo "Deleting logs older than $RETENTION_DAYS days"
    find "$(dirname "$LOGFILE")" -name "$(basename "${LOGFILE%.*}")_*.log" -type f -mtime +$RETENTION_DAYS -exec rm {} \;
    echo "Old logs deleted successfully."
}

rotate_logs