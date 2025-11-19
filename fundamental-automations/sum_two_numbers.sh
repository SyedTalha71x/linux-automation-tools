#!/bin/bash

# --------------------------------------------
# Sum 2 numbers script
# Author: Talha
# --------------------------------------------

# note: make sure that read does not use $ with variable names
read -p "Enter your first numner:" NUM1
read -p "Enter your second number:" NUM2
echo "Sum: $((NUM1 + NUM2))"