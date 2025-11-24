#!/bin/bash

# -----------------------------
#  Check If Specific User Exists Script
#  Author: Talha
# -----------------------------

USER=$1

if id $USER &>/dev/null; then
    echo "User exists"
else
    echo "User does not exists"
fi