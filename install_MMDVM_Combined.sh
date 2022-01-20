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
sleep 5
echo "[BUILD][$(date)] ===== Creating MMDVMHost Service ====="
notify-send 'BUILD' 'Creating MMDVMHost Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_mmdvmhost_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating MMDVMHost Shortcuts ====="
notify-send 'BUILD' 'Creating MMDVMHost Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVMHost.sh
sleep 5
echo "[BUILD][$(date)] ===== Building DMRGateway ====="
notify-send 'BUILD' 'Building DMRGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_dmrgateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating DMRGateway Shortcuts ====="
notify-send 'BUILD' 'Creating DMRGateway Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_DMRGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating DMRGateway Service ====="
notify-send 'BUILD' 'Creating DMRGateway Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_dmrgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building ircDDBGateway ====="
notify-send 'BUILD' 'Building ircDDBGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_ircddbgateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating ircDDBGateway Shortcuts ====="
notify-send 'BUILD' 'Creating ircDDBGateway Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_ircDDBGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating ircDDBGateway Service ====="
notify-send 'BUILD' 'Creating ircDDBGateway Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_ircddbgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building M17Gateway ====="
notify-send 'BUILD' 'Building M17Gateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_m17gateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating M17Gateway Shortcuts ====="
notify-send 'BUILD' 'Creating M17Gateway Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_M17Gateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating M17Gateway Service ====="
notify-send 'BUILD' 'Creating M17Gateway Service' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_m17gateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building NXDNClients ====="
notify-send 'BUILD' 'Building NXDNClients' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_nxdnclients.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating NXDNClients Shortcuts ====="
notify-send 'BUILD' 'Creating NXDNClients Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_NXDNGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating NXDNClients Service ====="
notify-send 'BUILD' 'Creating NXDNClients Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_nxdngateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building P25Clients ====="
notify-send 'BUILD' 'Building P25Clients' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_p25clients.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating P25Clients Shortcuts ====="
notify-send 'BUILD' 'Creating P25Clients Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_P25Gateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating P25Clients Service ====="
notify-send 'BUILD' 'Creating P25Clients Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_p25gateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building YSFClients ====="
notify-send 'BUILD' 'Building YSFClients' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_ysfclients.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating YSFClients Shortcuts ====="
notify-send 'BUILD' 'Creating YSFClients Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_YSFGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating YSFClients Service ====="
notify-send 'BUILD' 'Creating YSFClients Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_ysfgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building APRSGateway ====="
notify-send 'BUILD' 'Building APRSGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_aprsgateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating APRSGateway Shortcuts ====="
notify-send 'BUILD' 'Creating APRSGateway Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_APRsGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating APRSGateway Service ====="
notify-send 'BUILD' 'Creating APRSGateway Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_aprsgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building DAPNETGateway ====="
notify-send 'BUILD' 'Building DAPNETGateway' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_dapnetgateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating DAPNETGateway Shortcuts ====="
notify-send 'BUILD' 'Creating DAPNETGateway Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_DAPNETGateway.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating DAPNETGateway Service ====="
notify-send 'BUILD' 'Creating DAPNETGateway Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_dapnetgateway_service.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM_CM ====="
notify-send 'BUILD' 'Building MMDVM_CM' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvm_cm.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating MMDVM_CM Shortcuts ====="
notify-send 'BUILD' 'Creating MMDVM_CM Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVM_CM.sh
sleep 5
echo "[BUILD][$(date)] ===== Creating MMDVM_CM Service ====="
notify-send 'BUILD' 'Creating MMDVM_CM Service' --icon=dialog-information --urgency=critical
sudo /home/pi/Applications/kc2cbd-mmdvm-image/create-systemd/create_mmdvm_cm_service.sh
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
echo "[BUILD][$(date)] ===== Creating MMDVM Shortcuts ====="
notify-send 'BUILD' 'Creating MMDVM Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVM.sh
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM_HS ====="
notify-send 'BUILD' 'Building MMDVM_HS' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/install/install_mmdvm_hs.sh
echo "[BUILD][$(date)] ===== Creating MMDVM_HS Shortcuts ====="
notify-send 'BUILD' 'Creating MMDVM_HS Shortcuts' --icon=dialog-information --urgency=critical
/home/pi/Applications/kc2cbd-mmdvm-image/shortcuts/shortcuts_MMDVM_HS.sh
sleep 5
echo "[BUILD][$(date)] ===== All Applications Built Successfully ====="
notify-send 'BUILD' 'All Applications Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
