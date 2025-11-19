#!/bin/bash

# --------------------------------------------
# Check File Script
# Author: Talha
# --------------------------------------------

CHECK_FILE="../file-operations/fake.logs"
if [ -f $CHECK_FILE ]; then
    echo "File exists"
else
    echo "Sorry File doesnt exist"
fi
