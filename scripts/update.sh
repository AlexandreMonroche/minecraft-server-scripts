#!/bin/bash

# Minecraft Update Script

# Variables
ServerPath="/home/minecraft/server"   	# Location of server files
ScriptsPath="/home/minecraft/scripts"   # Location of scripts files
JarName="paper.jar"                     # Name of the jar file for this server
UpdateUrl=$1                            # Get update url

# Backup the server
$ScriptsPath/backup.sh

# Stop the server
$ScriptsPath/stop.sh

# Delete the old jar file, download the new one.
rm -vf $ServerPath/$JarName
wget --output-document=$ServerPath/$JarName $UpdateUrl

# Start the server
$ScriptsPath/start.sh
