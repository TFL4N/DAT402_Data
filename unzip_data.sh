#!/bin/bash

# Define the list of directories containing zip files
directories=("vert_left" "vert_right")

# Loop through each directory in the list
for dir in "${directories[@]}"; do
  echo "Processing directory: $dir"

  # Check if the directory exists
  if [ -d "$dir" ]; then
    # Find all .zip files within the current directory
    find "$dir" -maxdepth 1 -name "*.zip" -print0 | while IFS= read -r -d $'\0' file; do
      echo "  Unzipping: $file"
      # Create a directory with the same name as the zip file (without the .zip extension)
      output_dir="${file%.zip}"
      mkdir -p "$output_dir"

      # Unzip the file into the newly created directory
      unzip -o "$file" -d "$output_dir"

      if [ $? -eq 0 ]; then
        echo "    Successfully unzipped to: $output_dir"
      else
        echo "    Error unzipping: $file"
      fi
    done
  else
    echo "  Directory not found: $dir"
  fi
done

echo "Unzipping process complete."
