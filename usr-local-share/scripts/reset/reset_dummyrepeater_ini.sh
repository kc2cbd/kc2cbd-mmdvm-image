#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DummyRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DummyRepeater ====="
notify-send 'RESETINI' 'Stopping DummyRepeater' --icon=dialog-information --urgency=critical
pkill -f DummyRepeater
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DummyRepeater.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DummyRepeater.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DummyRepeater.ini /usr/local/etc/MMDVMConf/DummyRepeater_$(date +'%F').ini
cp /home/pi/Applications/DummyRepeater/DummyRepeater.ini /usr/local/etc/MMDVMConf/DummyRepeater.ini
sleep 5
echo "[RESETINI][$(date)] ===== DummyRepeater.ini Rebuilt Successful. Remember to Edit the DummyRepeater.ini ====="
notify-send 'RESETINI' 'DummyRepeater.ini Rebuilt Successful. Remember to Edit the DummyRepeater.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
