#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one directory."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

mkdir -p "$1/backup"

for file in "$1"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$1/backup/" &
        echo "Moving $(basename "$file") to backup/ in background. PID: $!"
    fi
done

wait
echo "All background processes finished."
