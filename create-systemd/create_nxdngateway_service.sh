#!/bin/bash

# Create NXDNGateway Service File
cat > /lib/systemd/system/nxdngateway.service << EOL
[Unit]
Description=NXDNGateway Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S NXDNGateway -D -m /usr/local/bin/NXDNClients /usr/local/etc/MMDVMConf/NXDNGateway.ini
ExecStop=/usr/bin/screen -S NXDNGateway -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/nxdngateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/nxdngateway.service
chmod 755 /lib/systemd/system/nxdngateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/nxdngateway.timer /etc/systemd/system/nxdngateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/nxdngateway.timer /etc/systemd/system/nxdngateway.timer
ln -s /lib/systemd/system/nxdngateway.service /etc/systemd/system/nxdngateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable nxdngateway.timer
systemctl mask nxdngateway.service
