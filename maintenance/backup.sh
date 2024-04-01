#!/bin/bash

# Define the source directory to be backed up
source_dir="/opt/papermc"

# Define the base backup directory
backup_base_dir="/mnt/backup/papermc"

# Get the current day of the week
day_of_week=$(date +%A)

# Define the destination backup directory
backup_dir="${backup_base_dir}/${day_of_week}"

# Create the destination backup directory if it does not exist
if [ ! -d "${backup_dir}" ]; then
  mkdir "${backup_dir}"
fi

# Perform the backup using rsync
rsync -avz --delete --exclude='.git' "${source_dir}" "${backup_dir}"

