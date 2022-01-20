#!/bin/bash

# Create NXDNGateway Service File
cat > /lib/systemd/system/nxdngateway.service << EOL
[Unit]
Description=NXDNReflector Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S NXDNReflector -D -m /usr/local/bin/NXDNReflector /usr/local/etc/MMDVMConf/NXDNReflector.ini
ExecStop=/usr/bin/screen -S NXDNReflector -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/nxdnreflector.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/nxdnreflector.service
chmod 755 /lib/systemd/system/nxdnreflector.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/nxdngateway.timer /etc/systemd/system/nxdnreflector.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/nxdnreflector.timer /etc/systemd/system/nxdnreflector.timer
ln -s /lib/systemd/system/nxdnreflector.service /etc/systemd/system/nxdnreflector.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable nxdnreflector.timer
