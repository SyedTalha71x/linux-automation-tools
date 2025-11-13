#!/bin/bash

# --------------------------------------------
# Uptime Checker Script
# Author: Talha
# --------------------------------------------

WEBSITE_URL="https://www.syedtalhahussain.com/"
LOG_FILE="uptime.log"

WEBHOOK_URL=""  # Optional: Set your Slack/Discord webhook URL here

# ---------------------------------
# Function: Send Alert Notification
# ---------------------------------
send_alert() {
    MESSAGE="ALERT! Website DOWN: $WEBSITE_URL (Status: $1)"

    if [[ -n "$WEBHOOK_URL" ]]; then
        # Slack/Discord supports JSON POST
        curl -s -X POST -H "Content-Type: application/json" \
            -d "{\"content\":\"$MESSAGE\"}" \
            "$WEBHOOK_URL" > /dev/null
    else
        echo "ALERT: $MESSAGE"
    fi
}

# ---------------------------------
# Function: Log Results
# ---------------------------------
log_result() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $1 | Status: $2" >> "$LOG_FILE"
}


# ---------------------------------
# Function: Check Website
# ---------------------------------
check_website() {
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$WEBSITE_URL")

    if [[ "$STATUS" == "200" ]]; then
        echo "SUCCESS - Website is UP"
        log_result "SUCCESS" "$STATUS"
    else
        echo "FAILED - Website is DOWN (Status: $STATUS)"
        log_result "FAILED" "$STATUS"
        send_alert "$STATUS"
    fi
}

# Run the checker
check_website