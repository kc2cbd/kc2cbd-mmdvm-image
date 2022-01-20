#!/bin/bash

#Create APRSGATEWAY Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/edit_dmr2m17.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DMR2M17.ini
GenericName=Edit DMR2M17.ini
Exec=geany /usr/local/etc/MMDVMConf/DMR2M17.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_dmr2nxdn.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DMR2NXDN.ini
GenericName=Edit DMR2NXDN.ini
Exec=geany /usr/local/etc/MMDVMConf/DMR2NXDN.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_dmr2p25.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DMR2P25.ini
GenericName=Edit DMR2P25.ini
Exec=geany /usr/local/etc/MMDVMConf/DMR2P25.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_dmr2ysf.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DMR2YSF.ini
GenericName=Edit DMR2YSF.ini
Exec=geany /usr/local/etc/MMDVMConf/DMR2YSF.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/edit_dstar2ysf.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=Edit DSTAR2YSF.ini
#GenericName=Edit DSTAR2YSF.ini
#Exec=geany /usr/local/etc/MMDVMConf/DSTAR2YSF.ini
#Icon=
#Terminal=false
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/edit_m172dmr.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit M172DMR.ini
GenericName=Edit M172DMR.ini
Exec=geany /usr/local/etc/MMDVMConf/M172DMR.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_m172ysf.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit M172YSF.ini
GenericName=Edit M172YSF.ini
Exec=geany /usr/local/etc/MMDVMConf/M172YSF.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_nxdn2dmr.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit NXDN2DMR.ini
GenericName=Edit NXDN2DMR.ini
Exec=geany /usr/local/etc/MMDVMConf/NXDN2DMR.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_p252dmr.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit P252DMR.ini
GenericName=Edit P252DMR.ini
Exec=geany /usr/local/etc/MMDVMConf/P252DMR.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_usrp2dmr.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit USRP2DMR.ini
GenericName=Edit USRP2DMR.ini
Exec=geany /usr/local/etc/MMDVMConf/USRP2DMR.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_usrp2m17.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit USRP2M17.ini
GenericName=Edit USRP2M17.ini
Exec=geany /usr/local/etc/MMDVMConf/USRP2M17.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_usrp2p25.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit USRP2P25.ini
GenericName=Edit USRP2P25.ini
Exec=geany /usr/local/etc/MMDVMConf/USRP2P25.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_usrp2ysf.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit USRP2YSF.ini
GenericName=Edit USRP2YSF.ini
Exec=geany /usr/local/etc/MMDVMConf/USRP2YSF.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_ysf2dmr.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit YSF2DMR.ini
GenericName=Edit YSF2DMR.ini
Exec=geany /usr/local/etc/MMDVMConf/YSF2DMR.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_ysf2nxdn.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit YSF2NXDN.ini
GenericName=Edit YSF2NXDN.ini
Exec=geany /usr/local/etc/MMDVMConf/YSF2NXDN.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/edit_ysf2p25.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit YSF2P25.ini
GenericName=Edit YSF2P25.ini
Exec=geany /usr/local/etc/MMDVMConf/YSF2P25.ini
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DMR2M17.ini
GenericName=Reset DMR2M17.ini
Exec=/usr/local/share/scripts/reset/reset_dmr2m17_ini.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DMR2NXDN.ini
GenericName=Reset DMR2NXDN.ini
Exec=/usr/local/share/scripts/reset/reset_dmr2nxdn_ini.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DMR2P25.ini
GenericName=Reset DMR2P25.ini
Exec=/usr/local/share/scripts/reset/reset_dmr2p25.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DMR2YSF.ini
GenericName=Reset DMR2YSF.ini
Exec=/usr/local/share/scripts/reset/reset_dmr2ysf.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dstar2ysf_resetini.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=Reset DSTAR2YSF.ini
#GenericName=Reset DSTAR2YSF.ini
#Exec=/usr/local/share/scripts/reset/reset_dstar2ysf.sh
#Icon=
#Terminal=true
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/m172dmr_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset M172DMR.ini
GenericName=Reset M172DMR.ini
Exec=/usr/local/share/scripts/reset/reset_m172dmr.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/m172ysf_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset M172YSF.ini
GenericName=Reset M172YSF.ini
Exec=/usr/local/share/scripts/reset/reset_m172ysf.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset NXDN2DMR.ini
GenericName=Reset NXDN2DMR.ini
Exec=/usr/local/share/scripts/reset/reset_nxdn2dmr.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset P252DMR.ini
GenericName=Reset P252DMR.ini
Exec=/usr/local/share/scripts/reset/reset_p252dmr.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset USRP2M17.ini
GenericName=Reset USRP2M17.ini
Exec=/usr/local/share/scripts/reset/reset_usrp2m17.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset USRP2P25.ini
GenericName=Reset USRP2P25.ini
Exec=/usr/local/share/scripts/reset/reset_usrp2p25.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset USRP2YSF.ini
GenericName=Reset USRP2YSF.ini
Exec=/usr/local/share/scripts/reset/reset_usrp2ysf.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset YSF2DMR.ini
GenericName=Reset YSF2DMR.ini
Exec=/usr/local/share/scripts/reset/reset_ysf2dmr.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset YSF2NXDN.ini
GenericName=Reset YSF2NXDN.ini
Exec=/usr/local/share/scripts/reset/reset_ysf2nxdn.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset YSF2P25.ini
GenericName=Reset YSF2P25.ini
Exec=/usr/local/share/scripts/reset/reset_ysf2p25.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/mmdvm_cm_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update MMDVM_CM
GenericName=Update MMDVM_CM
Exec=/usr/local/share/scripts/update/update_mmdvm_cm.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/mmdvm_cm_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild MMDVM_CM
GenericName=Rebuild MMDVM_CM
Exec=/usr/local/share/scripts/rebuild/rebuild_mmdvm_cm.sh
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2M17 Start
GenericName=DMR2M17 Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/DMR2M17 /usr/local/etc/MMDVMConf/DMR2M17.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2NXDN Start
GenericName=DMR2NXDN Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/DMR2NXDN /usr/local/etc/MMDVMConf/DMR2NXDN.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2P25 Start
GenericName=DMR2P25 Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/DMR2P25 /usr/local/etc/MMDVMConf/DMR2P25.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2YSF Start
GenericName=DMR2YSF Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/DMR2YSF /usr/local/etc/MMDVMConf/DMR2YSF.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dstar2ysf_start.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=DSTAR2YSF Start
#GenericName=DSTAR2YSF Start
#Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/DSTAR2YSF /usr/local/etc/MMDVMConf/DSTAR2YSF.ini"
#Icon=
#Terminal=false
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/m172dmr_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172DMR Start
GenericName=M172DMR Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/M172DMR /usr/local/etc/MMDVMConf/M172DMR.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/m172ysf_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172YSF Start
GenericName=M172YSF Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/M172YSF /usr/local/etc/MMDVMConf/M172YSF.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDN2DMR Start
GenericName=NXDN2DMR Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/NXDN2DMR /usr/local/etc/MMDVMConf/NXDN2DMR.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=P252DMR Start
GenericName=P252DMR Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/P252DMR /usr/local/etc/MMDVMConf/P252DMR.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2dmr_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2DMR Start
GenericName=USRP2DMR Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/USRP2DMR /usr/local/etc/MMDVMConf/USRP2DMR.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2M17 Start
GenericName=USRP2M17 Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/USRP2M17 /usr/local/etc/MMDVMConf/USRP2M17.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2P25 Start
GenericName=USRP2P25 Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/USRP2P25 /usr/local/etc/MMDVMConf/USRP2P25.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2YSF Start
GenericName=USRP2YSF Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/USRP2YSF /usr/local/etc/MMDVMConf/USRP2YSF.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2DMR Start
GenericName=YSF2DMR Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/YSF2DMR /usr/local/etc/MMDVMConf/YSF2DMR.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2NXDN Start
GenericName=YSF2NXDN Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/YSF2NXDN /usr/local/etc/MMDVMConf/YSF2NXDN.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2P25 Start
GenericName=YSF2P25 Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/YSF2P25 /usr/local/etc/MMDVMConf/YSF2P25.ini"
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2M17 Stop
GenericName=DMR2M17 Stop
Exec=gksudo pkill -f /usr/local/bin/DMR2M17
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2NXDN Stop
GenericName=DMR2NXDN Stop
Exec=gksudo pkill -f /usr/local/bin/DMR2NXDN
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2P25 Stop
GenericName=DMR2P25 Stop
Exec=gksudo pkill -f /usr/local/bin/DMR2P25
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2YSF Stop
GenericName=DMR2YSF Stop
Exec=gksudo pkill -f /usr/local/bin/DMR2YSF
Icon=
Terminal=false
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dstar2ysf_stop.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=DSTAR2YSF Stop
#GenericName=DSTAR2YSF Stop
#Exec=gksudo pkill -f /usr/local/bin/DSTAR2YSF
#Icon=
#Terminal=false
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/m172dmr_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172DMR Stop
GenericName=M172DMR Stop
Exec=gksudo pkill -f /usr/local/bin/M172DMR
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/m172ysf_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172YSF Stop
GenericName=M172YSF Stop
Exec=gksudo pkill -f /usr/local/bin/M172YSF
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDN2DMR Stop
GenericName=NXDN2DMR Stop
Exec=gksudo pkill -f /usr/local/bin/NXDN2DMR
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=P252DMR Stop
GenericName=P252DMR Stop
Exec=gksudo pkill -f /usr/local/bin/P252DMR
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2dmr_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2DMR Stop
GenericName=USRP2DMR Stop
Exec=gksudo pkill -f /usr/local/bin/USRP2DMR
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2M17 Stop
GenericName=USRP2M17 Stop
Exec=gksudo pkill -f /usr/local/bin/USRP2M17
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2P25 Stop
GenericName=USRP2P25 Stop
Exec=gksudo pkill -f /usr/local/bin/USRP2P25
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2YSF Stop
GenericName=USRP2YSF Stop
Exec=gksudo pkill -f /usr/local/bin/USRP2YSF
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2DMR Stop
GenericName=YSF2DMR Stop
Exec=gksudo pkill -f /usr/local/bin/YSF2DMR
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2NXDN Stop
GenericName=YSF2NXDN Stop
Exec=gksudo pkill -f /usr/local/bin/YSF2NXDN
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2P25 Stop
GenericName=YSF2P25 Stop
Exec=gksudo pkill -f /usr/local/bin/YSF2P25
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2M17 Background Service Console
GenericName=DMR2M17 Background Service Console
Exec=screen -r DMR2M17
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2NXDN Background Service Console
GenericName=DMR2NXDN Background Service Console
Exec=screen -r DMR2NXDN
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2P25 Background Service Console
GenericName=DMR2P25 Background Service Console
Exec=screen -r DMR2P25
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2YSF Background Service Console
GenericName=DMR2YSF Background Service Console
Exec=screen -r DMR2YSF
Icon=
Terminal=true
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dstar2ysf_service_console.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=DSTAR2YSF Background Service Console
#GenericName=DSTAR2YSF Background Service Console
#Exec=screen -r DSTAR2YSF
#Icon=
#Terminal=true
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/m172dmr_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172DMR Background Service Console
GenericName=M172DMR Background Service Console
Exec=screen -r M172DMR
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/m172ysf_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172YSF Background Service Console
GenericName=M172YSF Background Service Console
Exec=screen -r M172YSF
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDN2DMR Background Service Console
GenericName=NXDN2DMR Background Service Console
Exec=screen -r NXDN2DMR
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=P252DMR Background Service Console
GenericName=P252DMR Background Service Console
Exec=screen -r P252DMR
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2dmr_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2DMR Background Service Console
GenericName=USRP2DMR Background Service Console
Exec=screen -r USRP2DMR
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2M17 Background Service Console
GenericName=USRP2M17 Background Service Console
Exec=screen -r USRP2M17
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2P25 Background Service Console
GenericName=USRP2P25 Background Service Console
Exec=screen -r USRP2P25
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2YSF Background Service Console
GenericName=USRP2YSF Background Service Console
Exec=screen -r USRP2YSF
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2DMR Background Service Console
GenericName=YSF2DMR Background Service Console
Exec=screen -r YSF2DMR
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2NXDN Background Service Console
GenericName=YSF2NXDN Background Service Console
Exec=screen -r YSF2NXDN
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2P25 Background Service Console
GenericName=YSF2P25 Background Service Console
Exec=screen -r YSF2P25
Icon=
Terminal=true
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2M17 Background Service Start
GenericName=DMR2M17 Background Service Start
Exec=sudo systemctl start DMR2M17.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2NXDN Background Service Start
GenericName=DMR2NXDN Background Service Start
Exec=sudo systemctl start DMR2NXDN.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2P25 Background Service Start
GenericName=DMR2P25 Background Service Start
Exec=sudo systemctl start DMR2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2YSF Background Service Start
GenericName=DMR2YSF Background Service Start
Exec=sudo systemctl start DMR2YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dtar2ysf_service_start.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=DSTAR2YSF Background Service Start
#GenericName=DSTAR2YSF Background Service Start
#Exec=sudo systemctl start DSTAR2YSF.service
#Icon=
#Terminal=false
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/m172dmr_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172DMR Background Service Start
GenericName=M172DMR Background Service Start
Exec=sudo systemctl start M172DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/m172ysf_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172YSF Background Service Start
GenericName=M172YSF Background Service Start
Exec=sudo systemctl start M172YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDN2DMR Background Service Start
GenericName=NXDN2DMR Background Service Start
Exec=sudo systemctl start NXDN2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=P252DMR Background Service Start
GenericName=P252DMR Background Service Start
Exec=sudo systemctl start P252DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2dmr_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2DMR Background Service Start
GenericName=USRP2DMR Background Service Start
Exec=sudo systemctl start USRP2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2M17 Background Service Start
GenericName=USRP2M17 Background Service Start
Exec=sudo systemctl start USRP2M17.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2P25 Background Service Start
GenericName=USRP2P25 Background Service Start
Exec=sudo systemctl start USRP2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2YSF Background Service Start
GenericName=USRP2YSF Background Service Start
Exec=sudo systemctl start USRP2YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2DMR Background Service Start
GenericName=YSF2DMR Background Service Start
Exec=sudo systemctl start YSF2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2NXDN Background Service Start
GenericName=YSF2NXDN Background Service Start
Exec=sudo systemctl start YSF2NXDN.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2P25 Background Service Start
GenericName=YSF2P25 Background Service Start
Exec=sudo systemctl start YSF2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2M17 Background Service Stop
GenericName=DMR2M17 Background Service Stop
Exec=sudo systemctl stop DMR2M17.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2NXDN Background Service Stop
GenericName=DMR2NXDN Background Service Stop
Exec=sudo systemctl stop DMR2NXDN.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2P25 Background Service Stop
GenericName=DMR2P25 Background Service Stop
Exec=sudo systemctl stop DMR2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2YSF Background Service Stop
GenericName=DMR2YSF Background Service Stop
Exec=sudo systemctl stop DMR2YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dstar2ysf_service_stop.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=DSTAR2YSF Background Service Stop
#GenericName=DSTAR2YSF Background Service Stop
#Exec=sudo systemctl stop DSTAR2YSF.service
#Icon=
#Terminal=false
#Categories=MultiMode;
#EOL

cat > /home/pi/.local/share/applications/m172dmr_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172DMR Background Service Stop
GenericName=M172DMR Background Service Stop
Exec=sudo systemctl stop M172DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/m172ysf_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172YSF Background Service Stop
GenericName=M172YSF Background Service Stop
Exec=sudo systemctl stop M172YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDN2DMR Background Service Stop
GenericName=NXDN2DMR Background Service Stop
Exec=sudo systemctl stop NXDN2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=P252DMR Background Service Stop
GenericName=P252DMR Background Service Stop
Exec=sudo systemctl stop P252DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2dmr_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2DMR Background Service Stop
GenericName=USRP2DMR Background Service Stop
Exec=sudo systemctl stop USRP2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2M17 Background Service Stop
GenericName=USRP2M17 Background Service Stop
Exec=sudo systemctl stop USRP2M17.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2P25 Background Service Stop
GenericName=USRP2P25 Background Service Stop
Exec=sudo systemctl stop USRP2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2YSF Background Service Stop
GenericName=USRP2YSF Background Service Stop
Exec=sudo systemctl stop USRP2YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2DMR Background Service Stop
GenericName=YSF2DMR Background Service Stop
Exec=sudo systemctl stop YSF2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2NXDN Background Service Stop
GenericName=YSF2NXDN Background Service Stop
Exec=sudo systemctl stop YSF2NXDN.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2P25 Background Service Stop
GenericName=YSF2P25 Background Service Stop
Exec=sudo systemctl stop YSF2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2m17_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2M17 Background Service Restart
GenericName=DMR2M17 Background Service Restart
Exec=sudo systemctl restart DMR2M17.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2nxdn_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2NXDN Background Service Restart
GenericName=DMR2NXDN Background Service Restart
Exec=sudo systemctl restart DMR2NXDN.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2p25_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2P25 Background Service Restart
GenericName=DMR2P25 Background Service Restart
Exec=sudo systemctl restart DMR2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/dmr2ysf_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMR2YSF Background Service Restart
GenericName=DMR2YSF Background Service Restart
Exec=sudo systemctl restart DMR2YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

#cat > /home/pi/.local/share/applications/dstar2ysf_service_restart.desktop << EOL
#[Desktop Entry]
#Type=Application
#Name=DSTAR2YSF Background Service Restart
#GenericName=DSTAR2YSF Background Service Restart
#Exec=sudo systemctl restart DSTAR2YSF.service
#Icon=
#Terminal=false
#Categories=MultiMode;
#EOL

cat > /usr/share/applications/m172dmr_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172DMR Background Service Restart
GenericName=M172DMR Background Service Restart
Exec=sudo systemctl restart M172DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL
cat > /home/pi/.local/share/applications/m172ysf_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=M172YSF Background Service Restart
GenericName=M172YSF Background Service Restart
Exec=sudo systemctl restart M172YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/nxdn2dmr_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDN2DMR Background Service Restart
GenericName=NXDN2DMR Background Service Restart
Exec=sudo systemctl restart NXDN2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/p252dmr_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=P252DMR Background Service Restart
GenericName=P252DMR Background Service Restart
Exec=sudo systemctl restart P252DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2dmr_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2DMR Background Service Restart
GenericName=USRP2DMR Background Service Restart
Exec=sudo systemctl restart USRP2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2m17_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2M17 Background Service Restart
GenericName=USRP2M17 Background Service Restart
Exec=sudo systemctl restart USRP2M17.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2p25_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2P25 Background Service Restart
GenericName=USRP2P25 Background Service Restart
Exec=sudo systemctl restart USRP2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/usrp2ysf_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=USRP2YSF Background Service Restart
GenericName=USRP2YSF Background Service Restart
Exec=sudo systemctl restart USRP2YSF.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2dmr_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2DMR Background Service Restart
GenericName=YSF2DMR Background Service Restart
Exec=sudo systemctl restart YSF2DMR.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2nxdn_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2NXDN Background Service Restart
GenericName=YSF2NXDN Background Service Restart
Exec=sudo systemctl restart YSF2NXDN.service
Icon=
Terminal=false
Categories=MultiMode;
EOL

cat > /home/pi/.local/share/applications/ysf2p25_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSF2P25 Background Service Restart
GenericName=YSF2P25 Background Service Restart
Exec=sudo systemctl restart YSF2P25.service
Icon=
Terminal=false
Categories=MultiMode;
EOL
