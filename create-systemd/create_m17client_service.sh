#!/bin/bash

# Create M17Gateway Service File
cat > /lib/systemd/system/m17client.service << EOL
[Unit]
Description=M17Client Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S M17Client -D -m /usr/local/bin/M17Client /usr/local/etc/MMDVMConf/M17Client.ini
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
chmod 755 /lib/systemd/system/m17client.service
chmod 755 /lib/systemd/system/m17client.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/m17client.timer /etc/systemd/system/m17client.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/m17client.timer /etc/systemd/system/m17client.timer
ln -s /lib/systemd/system/m17client.service /etc/systemd/system/m17client.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable m17client.timer
systemctl mask m17client.service
