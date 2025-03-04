#!/bin/bash
mkdir unzziped
REPO_DIR=$(pwd) 
ARCHIVE_NAME="repository_archive.tar.gz" 
DEST_DIR="unzziped" 

echo "Creating archive of all files in the repository..."
tar -czf "$ARCHIVE_NAME" -C "$REPO_DIR" .

# Check if the archive was created successfully
if [ $? -eq 0 ]; then
  echo "Archive created successfully: $ARCHIVE_NAME"
else
  echo "Error: Failed to create archive."
  exit 1
fi

echo "Unzipping the archive to $DEST_DIR..."
mkdir -p "$DEST_DIR"  # Create the destination directory if it doesn't exist
tar -xzf "$ARCHIVE_NAME" -C "$DEST_DIR"

if [ $? -eq 0 ]; then
  echo "Archive unzipped successfully to: $DEST_DIR"
else
  echo "Error: Failed to unzip archive."
  exit 1
fi
