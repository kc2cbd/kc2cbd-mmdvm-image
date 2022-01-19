#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Client"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Installing Needed Applications ====="
notify-send 'BUILD' 'Installing Needed Applications' --icon=dialog-information
sudo apt-get update && sudo apt-get -y install libhamlib++-dev libhamlib-dev libsamplerate0-dev
sleep 5
echo "[BUILD][$(date)] ===== Downloading M17Client ====="
notify-send 'BUILD' 'Downloading M17Client' --icon=dialog-information
git clone https://github.com/g4klx/M17Client.git /home/pi/Applications/M17Client
sleep 5
echo "[BUILD][$(date)] ===== Building M17Client from Repository ====="
notify-send 'BUILD' 'Building M17Client from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/M17Client/Daemon
make clean
make
sudo make install
sleep 5
cd /home/pi/Applications/M17Client/GUI
sed -i 's+export BINDIR  := /usr/bin+export BINDIR  := /usr/local/bin+g' Makefile
make clean
make
sudo make install
sleep 5
cd /home/pi/Applications/M17Client/TS
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying M17Client.ini from Repository ====="
notify-send 'BUILD' 'Copying M17Client.ini from Repository' --icon=dialog-information
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/M17Client.ini /usr/local/etc/MMDVMConf
sleep 5
echo "[BUILD][$(date)] ===== M17Client Built Successfully ====="
notify-send 'BUILD' 'M17Client Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
