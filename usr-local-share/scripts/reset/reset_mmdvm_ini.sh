#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMini"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping MMDVMHost ====="
notify-send 'RESETINI' 'Stopping MMDVMHost' --icon=dialog-information --urgency=critical
pkill -f MMDVMHost
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding MMDVM.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding MMDVM.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/MMDVM.ini /usr/local/etc/MMDVMConf/MMDVM_$(date +'%F').ini
cp /home/pi/Applications/MMDVMHost/MMDVM.ini /usr/local/etc/MMDVMConf/MMDVM.ini
sleep 5
echo "[RESETINI][$(date)] ===== MMDVM.ini Rebuilt Successful. Remember to Edit the MMDVM.ini ====="
notify-send 'RESETINI' 'MMDVM.ini Rebuilt Successful. Remember to Edit the MMDVM.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
