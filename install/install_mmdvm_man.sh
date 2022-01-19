#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_man"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading MMDVM_man ====="
notify-send 'BUILD' 'Downloading MMDVM_man' --icon=dialog-information
git clone https://github.com/VR2VYE/MMDVM_man.git /home/pi/Applications/MMDVM_man
sleep 5
echo "[BUILD][$(date)] ===== MMDVM_man Downloaded Successfully ====="
notify-send 'BUILD' 'MMDVM_man Downloaded Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
