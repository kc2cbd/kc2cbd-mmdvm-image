#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="ircDDBGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Install Needed Applications ====="
notify-send 'BUILD' 'Install Needed Applications' --icon=dialog-information --urgency=critical
sudo apt-get update && sudo apt-get -y install git build-essential libasound2-dev libusb-1.0-0-dev libwxgtk3.0-gtk3-dev
sleep 5
echo "[BUILD][$(date)] ===== Download and Build WiringPi ====="
notify-send 'BUILD' 'Install Need Applications' --icon=dialog-information --urgency=critical
git clone https://github.com/WiringPi/WiringPi.git /home/pi/Applications/WiringPi
cd /home/pi/Applications/WiringPi
sudo ./build
sleep 5
echo "[BUILD][$(date)] ===== Downloading ircDDBGateway ====="
notify-send 'BUILD' 'Downloading ircDDBGateway' --icon=dialog-information
git clone https://github.com/g4klx/ircDDBGateway.git /home/pi/Applications/ircDDBGateway
sleep 5
echo "[BUILD][$(date)] ===== Editing Makefile ====="
notify-send 'BUILD' 'Editing Makefile' --icon=dialog-information
cd /home/pi/Applications/ircDDBGateway
sed -i 's+export DATADIR ?= /usr/share/opendv+export DATADIR ?= /usr/local/share/opendv+g' Makefile
sed -i 's+export LOGDIR  ?= /var/log/opendv+export LOGDIR  ?= /var/log/MMDVM+g' Makefile
sed -i 's+export CONFDIR ?= /etc+export CONFDIR ?= /usr/local/etc/MMDVMConf+g' Makefile
sed -i 's+export BINDIR  ?= /usr/sbin+export BINDIR  ?= /usr/local/sbin+g' Makefile
sed -i 's+export DATADIR ?= /usr/share/ircddbgateway+export DATADIR ?= /usr/local/share/ircddbgateway+g' Makefile
sed -i 's+export LOGDIR  ?= /var/log+export LOGDIR  ?= /var/log/MMDMV+g' Makefile
sed -i 's+export CONFDIR ?= /etc+export CONFDIR ?= /usr/local/etc/MMDVMConf+g' Makefile
sed -i 's+export BINDIR  ?= /usr/bin+export BINDIR  ?= /usr/local/bin+g' Makefile
sed -i 's+export DATADIR ?= /usr/share/opendv+export DATADIR ?= /usr/local/share/ircddbgateway+g' MakefileGUI
sed -i 's+export LOGDIR  ?= /var/log/opendv+export LOGDIR  ?= /var/log/MMDVM+g' MakefileGUI
sed -i 's+export CONFDIR ?= /etc+export CONFDIR ?= /usr/local/etc/MMDVMConf+g' MakefileGUI
sed -i 's+export BINDIR  ?= /usr/sbin+export BINDIR  ?= /usr/local/sbin+g' MakefileGUI
sed -i 's+export DATADIR ?= /usr/share/ircddbgateway+export DATADIR ?= /usr/local/share/ircddbgateway+g' MakefileGUI
sed -i 's+export LOGDIR  ?= /var/log+export LOGDIR  ?= /var/log/MMDMV+g' MakefileGUI
sed -i 's+export CONFDIR ?= /etc+export CONFDIR ?= /usr/local/etc/MMDVMConf+g' MakefileGUI
sed -i 's+export BINDIR  ?= /usr/bin+export BINDIR  ?= /usr/local/bin+g' MakefileGUI
sleep 5
echo "[BUILD][$(date)] ===== Building ircDDBGateway from Repository ====="
notify-send 'BUILD' 'Building ircDDBGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/ircDDBGateway
make clean
make -j2 -f MakefileGUI BUILD=release
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying ini Files ====="
notify-send 'BUILD' 'Copying ini Files' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/ircddbgateway.ini /usr/local/etc/MMDVMConf
sleep 5
echo "[BUILD][$(date)] ===== ircDDBGateway Built Successfully ====="
notify-send 'BUILD' 'ircDDBGateway Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
