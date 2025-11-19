#!/bin/bash

# --------------------------------------------
# File Size Check Script
# Author: Talha
# --------------------------------------------

CHECK_FILE="../file-operations/system_health_check_script.sh"
if [ -f $CHECK_FILE ]; then
    FILE_SIZE=$(stat -c%s "$CHECK_FILE")
    echo "File size of $CHECK_FILE is $FILE_SIZE bytes."
else
    echo "Sorry, file doesn't exist."
fi
