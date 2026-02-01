#!/bin/bash

if [ ! -f emails.txt ]; then
    echo "Error: emails.txt not found."
    exit 1
fi

grep -Ei '^[a-z0-9]+@[a-z]+\.com$' emails.txt | sort | uniq > valid.txt
grep -Eiv '^[a-z0-9]+@[a-z]+\.com$' emails.txt > invalid.txt

echo "Email cleaning completed."
