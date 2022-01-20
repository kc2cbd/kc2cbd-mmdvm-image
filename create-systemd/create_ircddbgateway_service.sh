#!/bin/bash

# Create ircDDBGateway Service File
cat > /lib/systemd/system/ircddbgateway.service << EOL
[Unit]
Description=ircDDBGateway Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S ircDDBGateway -D -m /usr/local/bin/ircDDBGateway /usr/local/etc/MMDVMConf/ircDDBGateway.ini
ExecStop=/usr/bin/screen -S ircDDBGateway -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/ircddbgateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/ircddbgateway.service
chmod 755 /lib/systemd/system/ircddbgateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/ircddbgateway.timer /etc/systemd/system/ircddbgateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/ircddbgateway.timer /etc/systemd/system/ircddbgateway.timer
ln -s /lib/systemd/system/ircddbgateway.service /etc/systemd/system/ircddbgateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable ircddbgateway.timer
