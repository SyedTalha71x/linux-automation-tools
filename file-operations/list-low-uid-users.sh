#!/bin/bash

# --------------------------------------------
# List low UID Users Script
# Author: Talha
# --------------------------------------------

echo "Users with UID less then 1000"

awk -F: '$3  < 1000 {print $1, $3}' < /etc/passwd


