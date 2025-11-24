#!/bin/bash

# -----------------------------
#  Kill Process by Name Script
#  Author: Talha
# -----------------------------

PROCESS=$1

pkill "$PROCESS"

if [ $? -eq 0 ]; then
    echo "Process has beeen terminated"
else
    echo "Process not found or could not be terminated"
fi
