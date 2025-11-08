#!/bin/bash

echo "----- System Health Check Report -----"

echo "Date: $(date)"
echo "System Uptime: $(uptime -p)"
echo "Memory usage: $(free -h)"
echo "Disk Usage: $(df -h)"
echo "Logged in users: $(who)"

