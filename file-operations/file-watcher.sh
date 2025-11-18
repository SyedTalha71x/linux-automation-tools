#!/bin/bash

# --------------------------------------------
# File Watcher Script
# Author: Talha
# --------------------------------------------

WATCH_DIR="./watched_dir"

echo "Monitoring directory: $WATCH_DIR for changes..."

inotifywait -m -e create "$WATCH_DIR" --format '%f' | while read NEWFILE
do
    echo "New file created: $NEWFILE"
done
