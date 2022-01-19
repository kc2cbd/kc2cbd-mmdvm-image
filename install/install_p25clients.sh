#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="P25Clients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading P25Clients ====="
notify-send 'BUILD' 'Downloading P25Clients' --icon=dialog-information
git clone https://github.com/g4klx/P25Clients.git /home/pi/Applications/P25Clients
sleep 5
echo "[BUILD][$(date)] ===== Building P25Clients from Repository ====="
notify-send 'BUILD' 'Building P25Clients from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/P25Clients
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying P25Gateway Files ====="
notify-send 'BUILD' 'Copying P25Gateway Files' --icon=dialog-information
sudo mkdir -p /usr/local/share/P25Gateway
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/P25Gateway.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/P25Reflector.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/hosts/P25Hosts.txt /usr/local/etc/MMDVMHost
sudo cp /home/pi/Applications/P25Clients/P25Gateway/Audio/* /usr/local/share/P25Gateway
cd /home/pi/Downloads
wget https://www.radioid.net/static/dmrid.dat
sudo cp /home/pi/Downloads/dmrid.dat /usr/local/etc/DMRIds.dat
sleep 5
echo "[BUILD][$(date)] ===== P25Clients Built Successfully ====="
notify-send 'BUILD' 'P25Clients Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
