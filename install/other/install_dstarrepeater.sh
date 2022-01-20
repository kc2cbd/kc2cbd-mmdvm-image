#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DStarRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Install Need Applications ====="
notify-send 'BUILD' 'Install Need Applications' --icon=dialog-information --urgency=critical
sudo apt-get update && sudo apt-get -y install git build-essential libasound2-dev libusb-1.0-0-dev libwxgtk3.0-gtk3-dev
sleep 5
echo "[BUILD][$(date)] ===== Download and Build WiringPi ====="
notify-send 'BUILD' 'Install Need Applications' --icon=dialog-information --urgency=critical
git clone https://github.com/WiringPi/WiringPi.git /home/pi/Applications/WiringPi
cd /home/pi/Applications/WiringPi
sudo ./build
sleep 5
echo "[BUILD][$(date)] ===== Downloading DStarRepeater ====="
notify-send 'BUILD' 'Downloading DStarRepeater' --icon=dialog-information
git clone https://github.com/g4klx/DStarRepeater.git /home/pi/Applications/DStarRepeater
sleep 5
echo "[BUILD][$(date)] ===== Editing MakefilePi ====="
notify-send 'BUILD' 'Editing MakefilePi' --icon=dialog-information
cd /home/pi/Applications/DStarRepeater
sed -i 's+export DATADIR := "/usr/share/dstarrepeater"+export DATADIR := "/usr/local/share"+g' MakefilePi
sed -i 's+export LOGDIR  := "/var/log"+export LOGDIR  := "/var/log/MMDVM"+g' MakefilePi
sed -i 's+export CONFDIR := "/etc"+export CONFDIR := "/usr/local/etc/MMDVMConf"+g' MakefilePi
sed -i 's+export BINDIR  := "/usr/bin"+export BINDIR  := "/usr/local/bin"+g' MakefilePi
sleep 5
echo "[BUILD][$(date)] ===== Building DStarRepeater from Repository ====="
notify-send 'BUILD' 'Building DStarRepeater from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DStarRepeater
make clean
make -j2 --file MakefilePi
sudo make -j2 --file MakefilePi install
sleep 5
echo "[BUILD][$(date)] ===== Copying DStarRepeater Configuration from Repository ====="
notify-send 'BUILD' 'Copying DStarRepeater Configuration from Repository' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/dstarrepeater.example /usr/local/etc/MMDVMConf/dstarrepeater
sleep 5
echo "[BUILD][$(date)] ===== Editing DStarRepeater Configuration ====="
notify-send 'BUILD' 'Editing DStarRepeater Configuration' --icon=dialog-information
sudo /usr/local/bin/dstarrepeaterconfig &>/dev/null &
sleep 5
echo "[BUILD][$(date)] ===== DStarRepeater Built Successfully ====="
notify-send 'BUILD' 'DStarRepeater Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
