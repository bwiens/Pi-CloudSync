#!/bin/bash
# Authors Benjamin Wiens & Björn Sunedahl 

# Variables
Remotehost=""
Remoteport=""
Remotedir=""
Homedir=""
User=""
Logfile=""
Email=""
Emailfile=""

# Start logging.
echo "Pi-CloudSync started at $(date) by $(whoami)" >> $Logfile;