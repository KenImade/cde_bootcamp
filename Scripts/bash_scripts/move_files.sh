#!/bin/bash

SOURCE_DIR="source_directory"
DEST_DIR="json_and_CSV"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move CSV and JSON files
echo "Moving CSV and JSON files..."
mv "$SOURCE_DIR"/*.csv "$DEST_DIR" 2>/dev/null
mv "$SOURCE_DIR"/*.json "$DEST_DIR" 2>/dev/null

echo "Files have been moved to $DEST_DIR."