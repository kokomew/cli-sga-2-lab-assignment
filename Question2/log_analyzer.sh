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
warning=$(grep -c "WARNING" "$1")
error=$(grep -c "ERROR" "$1")
latest_error=$(grep "ERROR" "$1" | tail -n 1)

echo "Total entries: $total"
echo "INFO messages: $info"
echo "WARNING messages: $warning"
echo "ERROR messages: $error"
echo "Most recent ERROR: $latest_error"

date=$(date +%F)
report="logsummary_$date.txt"

echo "Total entries: $total" > "$report"
echo "INFO messages: $info" >> "$report"
echo "WARNING messages: $warning" >> "$report"
echo "ERROR messages: $error" >> "$report"
echo "Most recent ERROR: $latest_error" >> "$report"
