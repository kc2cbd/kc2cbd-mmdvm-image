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

echo "[REBUILD][$(date)] ===== Stopping DStarRepeater ====="
notify-send 'REBUILD' 'Stopping DStarRepeater' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/dstarrepeaterd
sleep 5
echo "[REBUILD][$(date)] ===== Rebuilding DStarRepeater from Repository ====="
notify-send 'REBUILD' 'Rebuilding DStarRepeater from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DStarRepeater
sleep 5
git fetch --all
git reset --hard origin/master
sed -i 's+export DATADIR := "/usr/share/dstarrepeater"+export DATADIR := "/usr/local/etc"+g' MakefilePi
sed -i 's+export LOGDIR  := "/var/log"+export LOGDIR  := "/var/log/MMDVM"+g' MakefilePi
sed -i 's+export CONFDIR := "/etc"+export CONFDIR := "/home/pi/MMDVMConf"+g' MakefilePi
sed -i 's+export BINDIR  := "/usr/bin"+export BINDIR  := "/usr/local/bin"+g' MakefilePi
make clean
make -j2 --file MakefilePi
sudo make -j2 --file MakefilePi install
sleep 5
echo "[REBUILD][$(date)] ===== DStarRepeater Rebuilt Successfully ====="
notify-send 'REBUILD' 'DStarRepeater Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
