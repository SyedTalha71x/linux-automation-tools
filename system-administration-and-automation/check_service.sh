#!/bin/bash

# -----------------------------
#  Service Running Check (nginx, ssh, etc.) Script
#  Author: Talha
# -----------------------------

SERVICE=$1

if systemctl is-active --quiet $SERVICE; then
    echo "Service is running"
else
    echo "Service is not running"
    # sudo systemctl start $SERVICE
fi