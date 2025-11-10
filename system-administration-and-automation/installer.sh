#!/bin/bash

# --------------------------------------------
# Software Installer & Configurer Script
# Author: Talha
# --------------------------------------------

PACKAGES=("nginx" "git" "tree")


# run the script as root user 

if [ $EUID -ne 0 ]; then
    echo "This script must be run as root use sudo" 
    exit 1
fi


# detect the package manage apt or yum 

if command -v apt &> /dev/null; then
    PACKAGE_MANAGER="apt"
    UPDATE_CMD="apt update -y"
    INSTALL_CMD="apt install -y"
elif command -v yum &> /dev/null; then
    PACKAGE_MANAGER="yum"
    UPDATE_CMD="yum check-update -y"
    INSTALL_CMD="yum install -y"
elif command -v pacman >/dev/null 2>&1; then
  PKG_MANAGER="pacman"
  UPDATE_CMD="pacman -Sy --noconfirm"
  INSTALL_CMD="pacman -S --noconfirm"
else
    echo "No supported package manager found (apt or yum). Exiting."
    exit 1
fi


echo "Using package manager $PACKAGE_MANAGER"

echo "Updating package list"
$UPDATE_CMD 


# Install each package in the list
for pkgs in "${PACKAGES[@]}"; do
   echo "installing packages"
   $INSTALL_CMD $pkgs 
done

