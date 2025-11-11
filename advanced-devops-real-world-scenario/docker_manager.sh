#!/bin/bash

# --------------------------------------------
# Docker Manager Script
# Author: Talha
# --------------------------------------------

check_docker(){
    if ! systemctl is-active --quiet docker; then
        echo "Docker is not running, starting docker service"
        sudo systemctl start docker
    else
        echo "Docker is already running"
    fi
}

list_containers(){
    echo "Listing running docker containers"
    docker ps 
}

list_all(){
    echo "Listing all docker containers including stopped ones"
    docker ps -a
}

stop_container(){
    read -p "Enter container id to stop that container" CONTAINER_ID
    docker stop $CONTAINER_ID
}

start_container(){
    read -p "Enter container id to start that container" CONTAINER_ID
    docker start $CONTAINER_ID
}

remove_container(){
    read -p "Enter container id to remove that container" CONTAINER_ID
    docker rm $CONTAINER_ID
}


show_menu(){
    echo ""
    echo "=============================="
    echo " Docker Container Manager "
    echo "=============================="
    echo "1. List running containers"
    echo "2. List all containers"
    echo "3. Stop a container"
    echo "4. Remove a container"
    echo "5. Start a container"
    echo "6. Exit"
    echo "=============================="
}

check_docker

while true; do
    show_menu
    read -p "Choose an option [1-6]: " choice

    case $choice in
      1) list_containers ;;
      2) list_all ;;
      3) stop_container ;;
      4) remove_container ;;
      5) start_container ;;
      6) echo "Exiting..."; exit 0 ;;
    esac
done

