#!/bin/bash

# Find all .ly files in the current directory and its subdirectories
find . -name "*.ly" -print0 | while IFS= read -r -d '' file; do
  # Get the directory of the current .ly file
  directory=$(dirname "$file")

  # Run lilypond, specifying the output directory
  /home/willie/Projects/lilypond/_source/lilypond-2.26.0/bin/lilypond -o "$directory" "$file"
done
