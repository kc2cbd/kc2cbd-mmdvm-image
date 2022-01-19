#!/bin/bash

#Create MMDVMHost Shortcuts in Amateur Radio Menu
cat > /usr/share/applications/mmdvm-edit_mmdvmini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit MMDVM.ini
GenericName=Edit MMDVM.ini
Exec=geany /usr/local/etc/MMDVMConf/MMDVM.ini
Icon=
Terminal=false
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Start
GenericName=MMDVMHost Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/MMDVMHost /usr/local/etc/MMDVMConf/MMDVM.ini"
Icon=
Terminal=false
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Stop
GenericName=MMDVMHost Stop
Exec=gksudo pkill -f /usr/local/bin/MMDVMHost
Icon=
Terminal=false
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Console
GenericName=MMDVMHost Background Service Console
Exec=screen -r MMDVMHost
Icon=
Terminal=true
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Start
GenericName=MMDVMHost Background Service Start
Exec=sudo systemctl start mmdvmhost.service
Icon=
Terminal=false
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Stop
GenericName=MMDVMHost Background Service Stop
Exec=sudo systemctl stop mmdvmhost.service
Icon=
Terminal=false
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-mmdvmhost_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVMHost Background Service Restart
GenericName=MMDVMHost Background Service Restart
Exec=sudo systemctl restart mmdvmhost.service
Icon=
Terminal=false
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvmhost-update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update MMDVMHost
GenericName=Update MMDVMHost
Exec=/usr/local/share/scripts/update/update_mmdvmhost.sh
Icon=
Terminal=true
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvmhost-rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild MMDVMHost From Source
GenericName=Rebuild MMDVMHost From Source
Exec=/usr/local/share/scripts/rebuild/rebuild_mmdvmhost.sh
Icon=
Terminal=true
Categories=MMDVMHost;
EOL

cat > /usr/share/applications/mmdvm-resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset MMDVM.ini
GenericName=Reset MMDVM.ini
Exec=/usr/local/share/scripts/reset/reset_mmdvm_ini.sh.sh
Icon=
Terminal=true
Categories=MMDVMHost;
EOL
