#!/bin/bash

# --------------------------------------------
# Log File Analyzer Script
# Author: Talha
# --------------------------------------------

echo "This is a log file analyzer script"

if [ $# -ne 1 ]; then
   echo "Please pass the log directory in the argument to analyze those logs"
   exit 1
fi

LOGFILE=$(eval echo "$1")

if [ ! -f "$LOGFILE" ]; then 
   echo "Log file not found in the system please enter correct log file"
   exit 1
elif [ ! -r "$LOGFILE" ]; then
   echo "Log file exists but is not readable (check permissions)"
   exit 1
fi

echo "Analyzing log file: $LOGFILE"

TOTAL_LINES=$(wc -l < $LOGFILE)
echo "Total number of lines in the log file: $TOTAL_LINES"

ERROR_LINES=$(grep -i "error" $1 | wc -l)
echo "Total number of error lines in the log file: $ERROR_LINES"

WARNING_LINES=$(grep -i "warning" $1 | wc -l)
echo "Total number of warning lines in the log file: $WARNING_LINES"

SUCCESS_LINES=$(grep -i "success" $1 | wc -l)
echo "Total number of success lines in the log file: $SUCCESS_LINES"

