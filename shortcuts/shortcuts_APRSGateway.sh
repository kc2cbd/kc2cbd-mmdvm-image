#!/bin/bash

#Create APRSGATEWAY Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/aprsgateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=APRSGateway Start
GenericName=APRSGateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/APRSGateway /usr/local/etc/MMDVMConf/APRSGateway.ini"
Icon=
Terminal=false
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=APRSGateway Stop
GenericName=APRSGateway Stop
Exec=gksudo pkill -f /usr/local/bin/APRSGateway
Icon=
Terminal=false
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=APRSGateway Background Service Console
GenericName=APRSGateway Background Service Console
Exec=screen -r APRSGateway
Icon=
Terminal=true
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=APRSGateway Background Service Start
GenericName=APRSGateway Background Service Start
Exec=sudo systemctl start aprsgateway.service
Icon=
Terminal=false
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=APRSGateway Background Service Stop
GenericName=APRSGateway Background Service Stop
Exec=sudo systemctl stop aprsgateway.service
Icon=
Terminal=false
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=APRSGateway Background Service Restart
GenericName=APRSGateway Background Service Restart
Exec=sudo systemctl restart aprsgateway.service
Icon=
Terminal=false
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update APRSGateway
GenericName=Update APRSGateway
Exec=/usr/local/share/scripts/update/update_aprsgateway.sh
Icon=
Terminal=true
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/edit_aprsgatewayini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit APRSGateway.ini
GenericName=Edit APRSGateway.ini
Exec=sudo geany /usr/local/etc/MMDVMConf/APRSGateway.ini
Icon=
Terminal=false
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset APRSGateway.ini
GenericName=Reset APRSGateway.ini
Exec=/usr/local/share/scripts/reset/reset_aprsgateway_ini.sh
Icon=
Terminal=true
Categories=APRS;
EOL

cat > /home/pi/.local/share/applications/aprsgateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild APRSGateway
GenericName=Rebuild APRSGateway
Exec=/usr/local/share/scripts/rebuild/rebuild_aprsgateway.sh
Icon=
Terminal=true
Categories=APRS;
EOL
