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

cd /home/pi/Applications/DStarRepeater
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] DStarRepeater is Up-to-Date"
	notify-send 'UPDATE' 'DStarRepeater is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping DStarRepeater ====="
	notify-send 'UPDATE' 'Stopping DStarRepeater' --icon=dialog-information 
	pkill -f /usr/local/bin/dstarrepeaterd
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating DStarRepeater from Repository ====="
	notify-send 'UPDATE' 'Updating DStarRepeater from Repository' --icon=dialog-information 
	git pull
	make clean
	sed -i 's+export DATADIR := "/usr/share/dstarrepeater"+export DATADIR := "/usr/local/etc"+g' MakefilePi
	sed -i 's+export LOGDIR  := "/var/log"+export LOGDIR  := "/var/log/MMDVM"+g' MakefilePi
	sed -i 's+export CONFDIR := "/etc"+export CONFDIR := "/home/pi/MMDVMConf"+g' MakefilePi
	sed -i 's+export BINDIR  := "/usr/bin"+export BINDIR  := "/usr/local/bin"+g' MakefilePi
	make -j2 --file MakefilePi
	sudo make -j2 --file MakefilePi install
	sleep 2
	echo "[UPDATE][$(date)] ===== DStarRepeater Update Successful ====="
	notify-send 'UPDATE' 'DStarRepeater Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with DStarRepeater Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with DStarRepeater Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
