#!/bin/bash

# Create M17Gateway Service File
cat > /lib/systemd/system/m17gateway.service << EOL
[Unit]
Description=M17Gateway Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S M17Gateway -D -m /usr/local/bin/M17Gateway /usr/local/etc/MMDVMConf/M17Gateway.ini
ExecStop=/usr/bin/screen -S M17Gateway -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/m17gateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/m17gateway.service
chmod 755 /lib/systemd/system/m17gateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/m17gateway.timer /etc/systemd/system/m17gateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/m17gateway.timer /etc/systemd/system/m17gateway.timer
ln -s /lib/systemd/system/m17gateway.service /etc/systemd/system/m17gateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable m17gateway.timer
systemctl mask m17gateway.service
