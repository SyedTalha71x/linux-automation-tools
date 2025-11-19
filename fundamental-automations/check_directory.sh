#!/bin/bash

# --------------------------------------------
# Check Directory Script
# Author: Talha
# --------------------------------------------

CHECK_DIR="../file-operations"
if [ -d $CHECK_DIR ]; then
    echo "Directory exists"
else
    echo "Sorry directory doesnt exist"
fi
