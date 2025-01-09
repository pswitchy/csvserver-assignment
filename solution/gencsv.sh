#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 start_index end_index"
    exit 1
fi

start_index=$1
end_index=$2

# Clear the contents of inputFile or create it if it doesn't exist
> inputFile

for ((i=start_index; i<=end_index; i++))
do
    echo "$i, $RANDOM" >> inputFile
done

