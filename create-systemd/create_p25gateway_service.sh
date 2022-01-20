#!/bin/bash

# Create P25Gateway Service File
cat > /lib/systemd/system/p25gateway.service << EOL
[Unit]
Description=P25Gateway Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S P25Gateway -D -m /usr/local/bin/P25Clients /usr/local/etc/MMDVMConf/P25Gateway.ini
ExecStop=/usr/bin/screen -S P25Gateway -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/p25gateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/p25gateway.service
chmod 755 /lib/systemd/system/p25gateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/p25gateway.timer /etc/systemd/system/p25gateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/p25gateway.timer /etc/systemd/system/p25gateway.timer
ln -s /lib/systemd/system/p25gateway.service /etc/systemd/system/p25gateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable p25gateway.timer
