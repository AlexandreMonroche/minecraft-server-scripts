#!/bin/bash

# Minecraft Backup Script

# Variables
ServerPath="/home/minecraft/server"         # Location of server files
BackupPath="/home/minecraft/backupDaily"    # Location of the backup
MapName="MapMinecraft"                      # Name of the map folder
BackupStamp=$(date +%Y-%m-%d)               # Make a timestamp

# Alert users that backup will start.
screen -p 0 -S minecraft -X eval "stuff \"say Backup is progress...\"\015"

# We need to first put the server in readonly mode to reduce the chance of backing up half of a chunk.
screen -p 0 -S minecraft -X eval "stuff \"save-off\"\015"
screen -p 0 -S minecraft -X eval "stuff \"save-all\"\015"

# Wait a few seconds to make sure that Minecraft has finished backing up.
sleep 5

# Create an archived copy in .tar.gz format.
tar -cvzf $BackupPath/$MapName-$BackupStamp.tar.gz $ServerPath/$MapName*

# Don't forget to take the server out of readonly mode.
screen -p 0 -S minecraft -X eval "stuff \"save-on\"\015"

# Wait a second for the gnu-screen to allow another stuffing and optionally alert users that the backup has been completed.
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Backup completed.\"\015"

# Remove all old (older than 7 days) backups to cut down on disk utilization.
find $BackupPath/* -mtime +7 -exec rm {} -fv \;
