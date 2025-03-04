#!/bin/bash

mkdir -p unzipp
REPO_DIR=$(pwd)  # Get the current directory (the repository's root directory)
ARCHIVE_NAME="repository_archive.tar.gz"  # Name of the archive to create
DEST_DIR="unzipp"  # Directory where you want to unzip the files

# Create a tar.gz archive of all files in the current Git repository
echo "Creating archive of all files in the repository..."
tar -czf "$ARCHIVE_NAME" -C "$REPO_DIR" .

# Check if the archive was created successfully
if [ $? -eq 0 ]; then
  echo "Archive created successfully: $ARCHIVE_NAME"
else
  echo "Error: Failed to create archive."
  exit 1
fi

# Unzip the archive to the specified destination directory
echo "Unzipping the archive to $DEST_DIR..."
mkdir -p "$DEST_DIR"  # Create the destination directory if it doesn't exist
tar -xzf "$ARCHIVE_NAME" -C "$DEST_DIR"

# Check if the unzip process was successful
if [ $? -eq 0 ]; then
  echo "Archive unzipped successfully to: $DEST_DIR"
else
  echo "Error: Failed to unzip archive."
  exit 1
fi
