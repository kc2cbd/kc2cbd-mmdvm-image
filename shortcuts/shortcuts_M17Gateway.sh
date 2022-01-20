#!/bin/bash

#Create M17 Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/m17gateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=M17Gateway Start
GenericName=M17Gateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/M17Gateway /usr/local/etc/MMDVMConf/M17Gateway.ini"
Icon=
Terminal=false
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=M17Gateway Stop
GenericName=M17Gateway Stop
Exec=gksudo pkill -f /usr/local/bin/M17Gateway
Icon=
Terminal=false
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=M17Gateway Background Service Console
GenericName=M17Gateway Background Service Console
Exec=screen -r M17Gateway
Icon=
Terminal=true
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=M17Gateway Background Service Start
GenericName=M17Gateway Background Service Start
Exec=sudo systemctl start m17gateway.service
Icon=
Terminal=false
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=M17Gateway Background Service Stop
GenericName=M17Gateway Background Service Stop
Exec=sudo systemctl stop m17gateway.service
Icon=
Terminal=false
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=M17Gateway Background Service Restart
GenericName=M17Gateway Background Service Restart
Exec=sudo systemctl restart m17gateway.service
Icon=
Terminal=false
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update M17Gateway
GenericName=Update M17Gateway
Exec=/usr/local/share/scripts/update/update_m17gateway.sh
Icon=
Terminal=true
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/edit_m17gateway.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit M17Gateway.ini
GenericName=Edit M17Gateway.ini
Exec=geany /usr/local/etc/MMDVMConf/M17Gateway.ini
Icon=
Terminal=false
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset M17Gateway.ini
GenericName=Reset M17Gateway.ini
Exec=/usr/local/share/scripts/reset/reset_m17gateway_ini.sh
Icon=
Terminal=true
Categories=M17;
EOL

cat > /home/pi/.local/share/applications/m17gateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild M17Gateway
GenericName=Rebuild M17Gateway
Exec=/usr/local/share/scripts/rebuild/rebuild_m17gateway.sh
Icon=
Terminal=true
Categories=M17;
EOL
