#!/bin/bash

#Create MMDVM Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/mmdvm-update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update MMDVM
GenericName=Update MMDVM
Exec=/usr/local/share/scripts/update/update_mmdvm.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvm-rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild MMDVM From Source
GenericName=Rebuild MMDVM From Source
Exec=/usr/local/share/scripts/rebuild/rebuild_mmdvm.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvm-buildins.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM Build Instructions
GenericName=MMDVM Build Instructions
Exec=chromium-browser https://github.com/g4klx/MMDVM/blob/master/BUILD.txt &
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvm-mmdvmcal.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM Calibration
GenericName=Start MMDVMCal
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/MMDVMCal /dev/ttyAMA0"
Icon=
Terminal=false
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvmcal-update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update MMDVMCal
GenericName=Update MMDVMCal
Exec=/usr/local/share/scripts/update/update_mmdvmcal.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvmcal-rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild MMDVMCal From Source
GenericName=Rebuild MMDVMCal From Source
Exec=/usr/local/share/scripts/rebuild/rebuild_mmdvmcal.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvm_hs-update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update MMDVM_HS
GenericName=Update MMDVM_HS
Exec=/usr/local/share/scripts/update/update_mmdvm_hs.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvm_hs-rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild MMDVM_HS From Source
GenericName=Rebuild MMDVM_HS From Source
Exec=/usr/local/share/scripts/rebuild/rebuild_mmdvm_hs.sh
Icon=
Terminal=true
Categories=MMDVM;
EOL

cat > /home/pi/.local/share/applications/mmdvm_hs-buildins.desktop << EOL
[Desktop Entry]
Type=Application
Name=MMDVM_HS Build Instructions
GenericName=MMDVM_HS Build Instructions
Exec=chromium-browser https://github.com/juribeparada/MMDVM_HS/blob/master/BUILD.md &
Icon=
Terminal=false
Categories=MMDVM;
EOL
