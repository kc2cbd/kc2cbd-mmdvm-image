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

echo "[BUILD][$(date)] ===== Install Need Applications ====="
notify-send 'BUILD' 'Install Need Applications' --icon=dialog-information --urgency=critical
sudo apt-get update && sudo apt-get -y install git build-essential libasound2-dev libusb-1.0-0-dev libwxgtk3.0-gtk3-dev libboost-all-dev
sleep 5
echo "[BUILD][$(date)] ===== Download and Build WiringPi ====="
notify-send 'BUILD' 'Install Need Applications' --icon=dialog-information --urgency=critical
git clone https://github.com/WiringPi/WiringPi.git /home/pi/Applications/WiringPi
cd /home/pi/Applications/WiringPi
sudo ./build
sleep 5
echo "[BUILD][$(date)] ===== Downloading DummyRepeater ====="
notify-send 'BUILD' 'Downloading DummyRepeater' --icon=dialog-information
git clone https://github.com/g4klx/DummyRepeater.git /home/pi/Applications/DummyRepeater
sleep 5
echo "[BUILD][$(date)] ===== Editing Makefile ====="
notify-send 'BUILD' 'Editing Makefile' --icon=dialog-information
cd /home/pi/Applications/DummyRepeater
sed -i 's+export BINDIR  := /usr/bin+export BINDIR  := /usr/local/bin+g' MakefilePi
sleep 5
echo "[BUILD][$(date)] ===== Building DummyRepeater from Repository ====="
notify-send 'BUILD' 'Building DummyRepeater from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DummyRepeater
make clean
make -j2
sudo make -j2 install
sleep 5
echo "[BUILD][$(date)] ===== Opening Dummy Repeater for Configuration ====="
notify-send 'BUILD' 'Opening Dummy Repeater for Configuration' --icon=dialog-information
dummyrepeater &>/dev/null &
sleep 5
echo "[BUILD][$(date)] ===== DummyRepeater Built Successfully ====="
notify-send 'BUILD' 'DummyRepeater Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
