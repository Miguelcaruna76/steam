#!/bin/bash

# Function to start the Docker container
start_container() {
    docker run --detach --privileged -p 127.0.0.1:8083:8083 josh5/steam-headless
    if [ $? -eq 0 ]; then
        echo "Docker container started successfully!"
    else
        echo "Failed to start Docker container."
        exit 1
    fi
}

# Function to stop the Docker container
stop_container() {
    docker stop $(docker ps -q --filter ancestor=josh5/steam-headless)
    if [ $? -eq 0 ]; then
        echo "Docker container stopped successfully!"
    else
        echo "Failed to stop Docker container."
        exit 1
    fi
}

# Check if any arguments were provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [start | stop]"
    exit 1
fi

# Determine action based on provided argument
case "$1" in
    start)
        start_container
        ;;
    stop)
        stop_container
        ;;
    *)
        echo "Invalid argument. Usage: $0 [start | stop]"
        exit 1
        ;;
esac

exit 0
