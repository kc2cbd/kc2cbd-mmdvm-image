#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="FMRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Installing Needed Applications ====="
notify-send 'BUILD' 'Installing Needed Applications' --icon=dialog-information
sudo apt-get update && sudo apt-get -y install libasound2-dev
sleep 5
echo "[BUILD][$(date)] ===== Download and Build WiringPi ====="
notify-send 'BUILD' 'Install Need Applications' --icon=dialog-information --urgency=critical
git clone https://github.com/WiringPi/WiringPi.git /home/pi/Applications/WiringPi
cd /home/pi/Applications/WiringPi
sudo ./build
sleep 5
echo "[BUILD][$(date)] ===== Downloading FMRepeater ====="
notify-send 'BUILD' 'Downloading FMRepeater' --icon=dialog-information
git clone https://github.com/g4klx/FMRepeater.git /home/pi/Applications/FMRepeater
sleep 5
echo "[BUILD][$(date)] ===== Building FMRepeater from Repository ====="
notify-send 'BUILD' 'Building FMRepeater from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/FMRepeater
make clean
make
sudo install -m 755 FMRepeater /usr/local/bin/
sleep 5
echo "[BUILD][$(date)] ===== Copying FMRepeater.ini from Repository ====="
notify-send 'BUILD' 'Copying FMRepeater.ini from Repository' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/FMRepeater.ini /usr/local/etc/MMDVMConf
sleep 5
echo "[BUILD][$(date)] ===== FMRepeater Built Successfully ====="
notify-send 'BUILD' 'FMRepeater Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
