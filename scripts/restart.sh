#!/bin/bash

# Minecraft Restart Script

# Variables
ScriptsPath="/home/minecraft/scripts"    # Location of scripts files

# Alert users that server will restart.
screen -p 0 -S minecraft -X eval "stuff \"say Server is restarting...\"\015"

# Stop the server
$ScriptsPath/stop.sh

# Wait 30 seconds
sleep 30

# Start the server
$ScriptsPath/start.sh
