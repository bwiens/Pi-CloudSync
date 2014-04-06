#!/bin/bash
# Authors Benjamin Wiens & BHES

# Variables
Remotehost=""
Remoteport=""
Remotedir=""
Homedir=""
User=""
Logfile=""
Email=""
Emailfile=""

# Start logging
echo "Pi-CloudSync started at $(date) by $(whoami)" > $Logfile;

# Start RSYNC
rsync -rvz -e 'ssh -p $Remoteport' --progress $Homedir $User@$Remotehost:$Remotedir;
