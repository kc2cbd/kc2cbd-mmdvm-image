#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM-UDRC"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading MMDVM-UDRC ====="
notify-send 'BUILD' 'Downloading MMDVM-UDRC' --icon=dialog-information --urgency=critical
git clone https://github.com/g4klx/MMDVM-UDRC.git /home/pi/Applications/MMDVM-UDRC
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM-UDRC from Repository ====="
notify-send 'BUILD' 'Building MMDVM-UDRC from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVM-UDRC
make clean
make
sleep 5
echo "[BUILD][$(date)] ===== MMDVM-UDRC Built Successfully ====="
notify-send 'BUILD' 'MMDVM-UDRC Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
