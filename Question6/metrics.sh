#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one input file."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist."
    exit 1
fi

words=$(tr -s ' ' '\n' < "$1")
longest=$(echo "$words" | awk '{print length, $0}' | sort -nr | head -1 | cut -d" " -f2-)
shortest=$(echo "$words" | awk '{print length, $0}' | sort -n | head -1 | cut -d" " -f2-)
total_words=$(echo "$words" | wc -l)
total_chars=$(echo "$words" | awk '{sum+=length} END {print sum}')
average=$(echo "scale=2; $total_chars/$total_words" | bc)
unique_words=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $average"
echo "Total unique words: $unique_words"
