#!/bin/bash

# Minecraft Start Script

# Variables
ServerPath="/home/minecraft/server"     # Location of server files
JarName="paper.jar"                     # Name of the jar file for this server

# Move into the minecraft directory.
cd $ServerPath

# Start the game in a GNU screen. It will detatch automatically.
screen -dmS minecraft java -Xmx1024M -Xms512M -jar $JarName nogui
