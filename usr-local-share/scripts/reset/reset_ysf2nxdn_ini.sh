#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="YSF2NXDN"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping YSF2NXDN ====="
notify-send 'RESETINI' 'Stopping YSF2NXDN' --icon=dialog-information --urgency=critical
pkill -f YSF2NXDN
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding YSF2NXDN.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding YSF2NXDN.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/YSF2NXDN.ini /usr/local/etc/MMDVMConf/YSF2NXDN_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/YSF2NXDN/YSF2NXDN.ini /usr/local/etc/MMDVMConf/YSF2NXDN.ini
sleep 5
echo "[RESETINI][$(date)] ===== YSF2NXDN.ini Rebuilt Successful. Remember to Edit the YSF2NXDN.ini ====="
notify-send 'RESETINI' 'YSF2NXDN.ini Rebuilt Successful. Remember to Edit the YSF2NXDN.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
