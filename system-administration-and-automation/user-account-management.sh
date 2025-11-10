#!/bin/bash

# -----------------------------
#  User Account Management Script
#  Author: Talha
# -----------------------------

# check exisitng user 
check_existing_user(){
    if id $1 &>/dev/null; then
        return 0
    else 
        return 1
    fi
}

# Function to add the new user 
add_user(){
    read -p "Enter the username to add: " username
    if check_existing_user $username; then
        echo "$username already exists in the system"
    else
        sudo useradd $username
        sudo passwd $username
        echo "$username added successfully in the system"
    fi
}

# Function to delete the user
delete_user(){
    read -p "Enter the username to delete:" username
    if check_existing_user $username; then
        sudo userdel -r $username
        echo "$username deleted successfully from the system"
    else
        echo "$username does not exist in the system"
    fi
}

# list all users 
list_users(){
    echo "List of users in the system:"
    cut -d: -f1 /etc/passwd
}

# Main script execution
echo "========================================"
echo "   User Account Management Script"
echo "========================================"
echo "1️ Add a User"
echo "2️ Delete a User"
echo "3️ List All Users"
echo "4️ Exit"
echo "----------------------------------------"

read -p "Please choose an option ( 1 - 4): " choice

case $choice in
  1)
    add_user
    ;;
  2)
    delete_user
    ;;
  3)
    list_users
    ;;
  4)
    echo "Exiting the script"
    exit 0
    ;;
  5)
    echo "Invalid option"
esac