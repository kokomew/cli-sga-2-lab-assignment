#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one log file."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist."
    exit 1
fi

total=$(wc -l < "$1")
info=$(grep -c "INFO" "$1")
warn=$(grep -c "WARNING" "$1")
error=$(grep -c "ERROR" "$1")
recent_error=$(grep "ERROR" "$1" | tail -n 1)

echo "Total entries: $total"
echo "INFO messages: $info"
echo "WARNING messages: $warn"
echo "ERROR messages: $error"
echo "Most recent ERROR: $recent_error"
