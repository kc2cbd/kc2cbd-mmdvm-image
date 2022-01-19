#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMCal"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading MMDVMCal ====="
notify-send 'BUILD' 'Downloading MMDVMCal' --icon=dialog-information
git clone https://github.com/g4klx/MMDVMCal.git /home/pi/Applications/MMDVMCal
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVMCal from Repository ====="
notify-send 'BUILD' 'Building MMDVMCal from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVMCal
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== MMDVMCal Built Successfully ====="
notify-send 'BUILD' 'MMDVMCal Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
