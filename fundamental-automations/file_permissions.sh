#!/bin/bash

# --------------------------------------------
# Check File Permission Script
# Author: Talha
# --------------------------------------------

CHECK_FILE="../file-operations/system_health_check_script.sh"

if [ -r $CHECK_FILE ]; then
   echo "File is readable"
fi
if [ -w $CHECK_FILE ]; then
   echo "File is writable"
fi
if [ -x $CHECK_FILE ]; then
   echo "File is executable"
fi
