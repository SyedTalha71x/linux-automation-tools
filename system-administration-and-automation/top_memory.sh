#!/bin/bash

# -----------------------------
#  Top 10 Memory Consuming Process Script
#  Author: Talha
# -----------------------------

ps aux --sort=-%mem | head -n 11
