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

echo "[REBUILD][$(date)] ===== Stopping ircDDBGateway ====="
notify-send 'REBUILD' 'Stopping ircDDBGateway' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/ircDDBGateway
sleep 5
echo "[REBUILD][$(date)] ===== Rebuilding ircDDBGateway from Repository ====="
notify-send 'REBUILD' 'Rebuilding ircDDBGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/ircDDBGateway
git fetch --all
git reset --hard origin/master
echo "[BUILD][$(date)] ===== Editing Makefile ====="
notify-send 'BUILD' 'Editing Makefile' --icon=dialog-information
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
make clean
make -j2 -f MakefileGUI BUILD=release
sudo make install
sleep 5
echo "[REBUILD][$(date)] ===== ircDDBGateway Rebuilt Successfully ====="
notify-send 'REBUILD' 'ircDDBGateway Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
