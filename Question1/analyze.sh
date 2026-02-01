#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one argument (file or directory)."
    exit 1
fi

if [ ! -e "$1" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

if [ -f "$1" ]; then
    echo "File analysis of $1:"
    wc "$1"
    exit 0
fi

if [ -d "$1" ]; then
    total_files=$(find "$1" -type f | wc -l)
    txt_files=$(find "$1" -type f -name "*.txt" | wc -l)
    echo "Directory analysis of $1:"
    echo "Total files: $total_files"
    echo ".txt files: $txt_files"
    exit 0
fi
