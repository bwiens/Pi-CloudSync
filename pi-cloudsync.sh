#!/bin/bash
# Authors Benjamin Wiens & BHES

# Variables
Remotehost="172.16.0.1"
Remoteport="44444"
Remotedir="rsync"
Homedir="/home/root/leka"
User="insane"
Logfile=log_`date -I`-`date +%H%M%S`.html
DateTime=`date`
RunLogIndex="index.html"
Email="root@tfn.mine.nu"
Emailfile=""

# Start logging.
echo "Pi-CloudSync started at $(date) by $(whoami)" >> $Logfile;

# Start RSYNC.
echo "<PRE>" > $Logfile
rsync -rvz -e "ssh -p $Remoteport" --progress $Homedir $User@$Remotehost:$Remotedir >> $Logfile 2>&1

if [ $? -ne 0 ];
then
  status="<font color='#ff0000'>Error</font>";
else
  status="<font color='#00ff00'>OK</font>";
fi

if [ ! -e "$RunLogIndex" ]; then
  cat << EOF > $RunLogIndex
  <table border="2" cellpadding="2" cellspacing="2">
  <tr>
    <td>Date of Pi-CloudSync run</td><td>Logfile</td><td>Status</td>
  </tr>
EOF
fi

if [ -e "$RunLogIndex" ]; then
  cat <<EOF >> $RunLogIndex
  <table border="2" cellpadding="2" cellspacing="2">
  <tr>
    <td>$DateTime</td><td><a href="$Logfile">$Logfile</a></td><td>$status</td>
  </tr>
EOF
fi
