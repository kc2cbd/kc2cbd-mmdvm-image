#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Gateway"
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
echo "[BUILD][$(date)] ===== Downloading M17Gateway ====="
notify-send 'BUILD' 'Downloading M17Gateway' --icon=dialog-information
git clone https://github.com/g4klx/M17Gateway.git /home/pi/Applications/M17Gateway
sleep 5
echo "[BUILD][$(date)] ===== Building M17Gateway from Repository ====="
notify-send 'BUILD' 'Building M17Gateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/M17Gateway
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying M17Gateway.ini from Repository ====="
notify-send 'BUILD' 'Copying M17Gateway.ini from Repository' --icon=dialog-information
sudo mkdir -p /usr/local/share/M17Gateway
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/M17Gateway.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/hosts/M17Hosts.txt /usr/local/etc/MMDVMHost
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-share/scripts/M17HostsUpdate.sh /usr/local/share/scripts
sudo cp /home/pi/Applications/M17Gateway/Audio/* /usr/local/share/M17Gateway
sleep 5
echo "[BUILD][$(date)] ===== M17Gateway Built Successfully ====="
notify-send 'BUILD' 'M17Gateway Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
