#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one file."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist."
    exit 1
fi

echo "File analysis of $1:"
wc "$1"
