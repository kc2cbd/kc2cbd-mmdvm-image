#!/bin/bash

# Create MMDVMHost Service File
cat > /lib/systemd/system/mmdvmhost.service << EOL
[Unit]
Description=MMDVM Host Service
After=syslog.target network.target

[Service]
User=mmdvm
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S MMDVMHost -D -m /usr/local/bin/MMDVMHost /usr/local/etc/MMDVMConf/MMDVM.ini
ExecStop=/usr/bin/screen -S MMDVMHost -X quit
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/mmdvmhost.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/mmdvmhost.service
chmod 755 /lib/systemd/system/mmdvmhost.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/mmdvmhost.timer /etc/systemd/system/mmdvmhost.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/mmdvmhost.timer /etc/systemd/system/mmdvmhost.timer
ln -s /lib/systemd/system/mmdvmhost.service /etc/systemd/system/mmdvmhost.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable mmdvmhost.timer
systemctl enable mmdvmhost.service
