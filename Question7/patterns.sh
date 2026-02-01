#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one input file."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist."
    exit 1
fi

tr ' ' '\n' < "$1" | awk '
BEGIN{IGNORECASE=1}
{
    w=$0
    if(w ~ /^[aeiou]+$/) print w > "vowels.txt"
    else if(w ~ /^[^aeiou]+$/) print w > "consonants.txt"
    else if(w ~ /^[^aeiou]/ && w ~ /[aeiou]/) print w > "mixed.txt"
}'
echo "Email cleaning completed."
