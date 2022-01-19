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

echo "[REBUILD][$(date)] ===== Stopping DummyRepeater ====="
notify-send 'REBUILD' 'Stopping DummyRepeater' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/DummyRepeater
sleep 5
echo "[REBUILD][$(date)] ===== Rebuilding DummyRepeater from Repository ====="
notify-send 'REBUILD' 'Rebuilding DummyRepeater from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DummyRepeater
git fetch --all
git reset --hard origin/master
sed -i 's+export BINDIR  := /usr/bin+export BINDIR  := /usr/local/bin+g' MakefilePi
make clean
make -j5
sudo make -j5 install
sleep 5
echo "[REBUILD][$(date)] ===== DummyRepeater Rebuilt Successfully ====="
notify-send 'REBUILD' 'DummyRepeater Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
