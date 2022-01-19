#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMR2YSF"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DMR2YSF ====="
notify-send 'RESETINI' 'Stopping DMR2YSF' --icon=dialog-information --urgency=critical
pkill -f DMR2YSF
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DMR2YSF.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DMR2YSF.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DMR2YSF.ini /usr/local/etc/MMDVMConf/DMR2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2YSF/DMR2YSF.ini /usr/local/etc/MMDVMConf/DMR2YSF.ini
sleep 5
echo "[RESETINI][$(date)] ===== DMR2YSF.ini Rebuilt Successful. Remember to Edit the DMR2YSF.ini ====="
notify-send 'RESETINI' 'DMR2YSF.ini Rebuilt Successful. Remember to Edit the DMR2YSF.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
