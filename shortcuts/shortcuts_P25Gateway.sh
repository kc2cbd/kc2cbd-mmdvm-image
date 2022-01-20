#!/bin/bash

#Create P25Gateway Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/p25gateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=P25Gateway Start
GenericName=P25Gateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/P25Gateway /usr/local/etc/MMDVMConf/P25Gateway.ini"
Icon=
Terminal=false
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=P25Gateway Stop
GenericName=P25Gateway Stop
Exec=gksudo pkill -f /usr/local/bin/P25Gateway
Icon=
Terminal=false
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=P25Gateway Background Service Console
GenericName=P25Gateway Background Service Console
Exec=screen -r P25Gateway
Icon=
Terminal=true
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=P25Gateway Background Service Start
GenericName=P25Gateway Background Service Start
Exec=sudo systemctl start p25gateway.service
Icon=
Terminal=false
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=P25Gateway Background Service Stop
GenericName=P25Gateway Background Service Stop
Exec=sudo systemctl stop p25gateway.service
Icon=
Terminal=false
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=P25Gateway Background Service Restart
GenericName=P25Gateway Background Service Restart
Exec=sudo systemctl restart p25gateway.service
Icon=
Terminal=false
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update P25Gateway
GenericName=Update P25Gateway
Exec=/usr/local/share/scripts/update/update_p25gateway.sh
Icon=
Terminal=true
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/edit_p25gateway.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit P25Gateway.ini
GenericName=Edit P25Gateway.ini
Exec=geany /usr/local/etc/MMDVMConf/P25Gateway.ini
Icon=
Terminal=false
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset P25Gateway.ini
GenericName=Reset P25Gateway.ini
Exec=/usr/local/share/scripts/reset/reset_p25gateway_ini.sh
Icon=
Terminal=true
Categories=P25;
EOL

cat > /home/pi/.local/share/applications/p25gateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild P25Gateway
GenericName=Rebuild P25Gateway
Exec=/usr/local/share/scripts/rebuild/rebuild_p25gateway.sh
Icon=
Terminal=true
Categories=P25;
EOL
