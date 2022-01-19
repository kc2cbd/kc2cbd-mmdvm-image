#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="USRP2YSF"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping USRP2YSF ====="
notify-send 'RESETINI' 'Stopping USRP2YSF' --icon=dialog-information --urgency=critical
pkill -f USRP2YSF
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding USRP2YSF.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding USRP2YSF.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/USRP2YSF.ini /usr/local/etc/MMDVMConf/USRP2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2YSF/USRP2YSF.ini /usr/local/etc/MMDVMConf/USRP2YSF.ini
sleep 5
echo "[RESETINI][$(date)] ===== USRP2YSF.ini Rebuilt Successful. Remember to Edit the USRP2YSF.ini ====="
notify-send 'RESETINI' 'USRP2YSF.ini Rebuilt Successful. Remember to Edit the USRP2YSF.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
