#!/usr/bin/sh

# Created: 230911
# Modified: 230911
# Author: ChatGPT

#!/bin/bash

# Check if the user provided a folder path and a root name
if [ $# -ne 2 ]; then
    echo "Usage: $0 <folder_path> <root_name>"
    exit 1
fi

folder_path="$1"
root_name="$2"
counter=1

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Folder not found: $folder_path"
    exit 1
fi

# Loop through all files in the folder
for file in "$folder_path"/*; do
    if [ -f "$file" ]; then
        # Get the file extension
        extension="${file##*.}"

        # Create the new file name
        new_name="${root_name}${counter}.${extension}"

        # Rename the file
        mv "$file" "$folder_path/$new_name"

        echo "Renamed: $file -> $new_name"

        ((counter++))
    fi
done

echo "Batch renaming completed."

