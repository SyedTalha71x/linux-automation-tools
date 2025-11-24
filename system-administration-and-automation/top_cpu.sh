#!/bin/bash

# -----------------------------
#  Top 10 CPU Consuming Processes Script
#  Author: Talha
# -----------------------------

ps aux --sort=-%cpu | head -n 11
