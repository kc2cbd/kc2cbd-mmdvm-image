#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM-Service_Combined"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Creating MMDVMHost Service ====="
notify-send 'BUILD' 'Creating MMDVMHost Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_mmdvmhost_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating DMRGateway Service ====="
notify-send 'BUILD' 'Creating DMRGateway Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_dmrgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating ircDDBGateway Service ====="
notify-send 'BUILD' 'Creating ircDDBGateway Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_ircddbgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating M17Gateway Service ====="
notify-send 'BUILD' 'Creating M17Gateway Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_m17gateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating NXDNClients Service ====="
notify-send 'BUILD' 'Creating NXDNClients Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_nxdngateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating P25Clients Service ====="
notify-send 'BUILD' 'Creating P25Clients Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_p25gateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating YSFClients Service ====="
notify-send 'BUILD' 'Creating YSFClients Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_ysfgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating APRSGateway Service ====="
notify-send 'BUILD' 'Creating APRSGateway Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_aprsgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating DAPNETGateway Service ====="
notify-send 'BUILD' 'Creating DAPNETGateway Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_dapnetgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating MMDVM_CM Service ====="
notify-send 'BUILD' 'Creating MMDVM_CM Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_mmdvm_cm_service.sh
sleep 5
echo "[BUILD][$(date)] ===== All Services Built Successfully ====="
notify-send 'BUILD' 'All Services Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
