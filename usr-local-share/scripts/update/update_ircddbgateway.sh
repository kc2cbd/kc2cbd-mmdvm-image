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

cd /home/pi/Applications/ircDDBGateway
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] ircDDBGateway is Up-to-Date"
	notify-send 'UPDATE' 'ircDDBGateway is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping ircDDBGateway ====="
	notify-send 'UPDATEt' 'Stopping ircDDBGateway' --icon=dialog-information 
	pkill -f /usr/local/bin/ircDDBGatewayd
	sleep 5
	echo "[UPDATE][$(date)] ===== Updating ircDDBGateway from Repository ====="
	notify-send 'UPDATE' 'Updating ircDDBGateway from Repository' --icon=dialog-information 
	git pull
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
	echo "[UPDATE][$(date)] ===== ircDDBGateway Update Successful ====="
	notify-send 'UPDATE' 'ircDDBGateway Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with ircDDBGateway Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with ircDDBGateway Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
