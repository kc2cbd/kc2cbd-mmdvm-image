#!/bin/bash

#Create FMRepeater Shortcuts in Amateur Radio Menu
cat > /usr/share/applications/fmrepeater_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=FMRepeater Start
GenericName=FMRepeater Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/FMRepeater /usr/local/etc/MMDVMConf/FMRepeater.ini"
Icon=
Terminal=false
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=FMRepeater Stop
GenericName=FMRepeater Stop
Exec=gksudo pkill -f /usr/local/bin/FMRepeater
Icon=
Terminal=false
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=FMRepeater Background Service Console
GenericName=FMRepeater Background Service Console
Exec=screen -r FMRepeater
Icon=
Terminal=true
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=FMRepeater Background Service Start
GenericName=FMRepeater Background Service Start
Exec=sudo systemctl start fmrepeater.service
Icon=
Terminal=false
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=FMRepeater Background Service Stop
GenericName=FMRepeater Background Service Stop
Exec=sudo systemctl stop fmrepeater.service
Icon=
Terminal=false
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=FMRepeater Background Service Restart
GenericName=FMRepeater Background Service Restart
Exec=sudo systemctl restart fmrepeater.service
Icon=
Terminal=false
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update FMRepeater
GenericName=Update FMRepeater
Exec=/usr/local/share/scripts/update/update_fmrepeater.sh
Icon=
Terminal=true
Categories=FM;
EOL

cat > /usr/share/applications/edit_fmrepeater.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit FMRepeater.ini
GenericName=Edit FMRepeater.ini
Exec=geany /usr/local/etc/MMDVMConf/FMRepeater.ini
Icon=
Terminal=false
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset FMRepeater.ini
GenericName=Reset FMRepeater.ini
Exec=/usr/local/share/scripts/reset/reset_fmrepeater_ini.sh
Icon=
Terminal=true
Categories=FM;
EOL

cat > /usr/share/applications/fmrepeater_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild FMRepeater
GenericName=Rebuild FMRepeater
Exec=/usr/local/share/scripts/rebuild/rebuild_fmrepeater.sh
Icon=
Terminal=true
Categories=FM;
EOL
