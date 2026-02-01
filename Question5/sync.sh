#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Please provide two directories."
    exit 1
fi

if [ ! -d "$1" ] || [ ! -d "$2" ]; then
    echo "Error: One or both directories do not exist."
    exit 1
fi

echo "Files only in $1:"
ls "$1" | grep -vxF -f <(ls "$2")

echo
echo "Files only in $2:"
ls "$2" | grep -vxF -f <(ls "$1")

echo
echo "Common files comparison:"
for file in $(ls "$1"); do
    if [ -f "$2/$file" ]; then
        if cmp -s "$1/$file" "$2/$file"; then
            echo "$file: Contents match"
        else
            echo "$file: Contents differ"
        fi
    fi
done
