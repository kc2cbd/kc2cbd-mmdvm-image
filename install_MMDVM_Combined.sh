#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_Combined"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Building MMDVMHost ====="
notify-send 'BUILD' 'Building MMDVMHost' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvmhost.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVMHost.sh
sleep 5
echo "[BUILD][$(date)] ===== Building DMRGateway ====="
notify-send 'BUILD' 'Building DMRGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_dmrgateway.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_DMRGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building ircDDBGateway ====="
notify-send 'BUILD' 'Building ircDDBGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_ircddbgateway.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_ircDDBGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building M17Gateway ====="
notify-send 'BUILD' 'Building M17Gateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_m17gateway.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_M17Gateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building NXDNClients ====="
notify-send 'BUILD' 'Building NXDNClients' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_nxdnclients.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_NXDNGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building P25Clients ====="
notify-send 'BUILD' 'Building P25Clients' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_p25clients.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_P25Gateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building YSFClients ====="
notify-send 'BUILD' 'Building YSFClients' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_ysfclients.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_YSFGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building APRSGateway ====="
notify-send 'BUILD' 'Building APRSGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_aprsgateway.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_APRsGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building DAPNETGateway ====="
notify-send 'BUILD' 'Building DAPNETGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_dapnetgateway.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_DAPNETGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM_CM ====="
notify-send 'BUILD' 'Building MMDVM_CM' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvm_cm.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVM_CM.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVMCal ====="
notify-send 'BUILD' 'Building MMDVMCal' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvmcal.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM_man ====="
notify-send 'BUILD' 'Building MMDVM_man' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvm_man.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM ====="
notify-send 'BUILD' 'Building MMDVM' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvm.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVM.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM_HS ====="
notify-send 'BUILD' 'Building MMDVM_HS' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvm_hs.sh
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVM_HS.sh
sleep 5
echo "[BUILD][$(date)] ===== All Applications Built Successfully ====="
notify-send 'BUILD' 'All Applications Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
