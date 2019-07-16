#!/bin/bash
#Purpose of this script is to automatically find and delete disk images that are 60 days or older and are stored on the G-drive attached to the transfer station.
#This script will run as a launchagent on the transfer station at 4PM every day. 
#Version 1.0
#Created by Anuj Chokshi for Simons Foundation 

#timestamp to add for logging puroposes.
TIMESTAMP="$(/bin/date +"%Y-%m-%d %H:%M:%S %z %Z")"

#destination of the files being deleted
IMAGE_PATH="/Users/achokski/Desktop/Testing"

#log file name that gets created/modified every time script runs.
LOG_FILE_NAME="diskimage_cleanup_log.txt"

LOG="$IMAGE_PATH/$LOG_FILE_NAME"

#prints the following line in a log file
echo "Following disk images have been removed from the G-Drive on"  "${TIMESTAMP}" >> "$LOG"

echo " " >> "$LOG"

#finds the image file that are 60 days or older and deletes it and logs it to the log file. 
/usr/bin/find "$IMAGE_PATH"  -type f -iname '*.png'  -mtime +30  -exec echo "${TIMESTAMP}" {} \; -delete  >> "$LOG" 2>&1

echo " " >> "$LOG"
echo "-------------------------------------------" >> "$LOG"
echo " " >> "$LOG"

exit 0
