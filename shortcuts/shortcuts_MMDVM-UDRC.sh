#!/bin/bash

#Create MMDVM-UDRC Shortcuts in Amateur Radio Menu
cat > /usr/share/applications/mmdvm-udrc_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM-UDRC Start
GenericName=MMDVM-UDRC Start
Exec=lxterminal --working-directory="/home/pi/Applications/MMDVM-UDRC" --command="/home/pi/Applications/MMDVM-UDRC/MMDVM"
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM-UDRC Stop
GenericName=MMDVM-UDRC Stop
Exec=gksudo pkill -f /home/pi/Applications/MMDVM-UDRC/MMDVM
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM-UDRC Background Service Console
GenericName=MMDVM-UDRC Background Service Console
Exec=screen -r MMDVM-UDRC
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM-UDRC Background Service Start
GenericName=MMDVM-UDRC Background Service Start
Exec=sudo systemctl start mmdvm-udrc.service
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM-UDRC Background Service Stop
GenericName=MMDVM-UDRC Background Service Stop
Exec=sudo systemctl stop mmdvm-udrc.service
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM-UDRC Background Service Restart
GenericName=MMDVM-UDRC Background Service Restart
Exec=sudo systemctl restart mmdvm-udrc.service
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update MMDVM-UDRC
GenericName=Update MMDVM-UDRC
Exec=/usr/local/share/scripts/update/update_mmdvm-udrc.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /usr/share/applications/mmdvm-udrc_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild MMDVM-UDRC
GenericName=Rebuild MMDVM-UDRC
Exec=/usr/local/share/scripts/rebuild/rebuild_mmdvm-udrc.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL
