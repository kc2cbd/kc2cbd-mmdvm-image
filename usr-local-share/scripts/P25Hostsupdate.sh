#! /bin/sh

###################################################
#                                                 #
# P25Hosts                                        #
#                                                 #
###################################################

#wget -O /var/lib/mmdvm/P25Hosts.txt -q "https://github.com/g4klx/P25Clients/raw/master/P25Gateway/P25Hosts.txt"
wget -O /usr/local/etc/MMDVMHost/P25Hosts.txt -q "https://github.com/g4klx/P25Clients/raw/master/P25Gateway/P25Hosts.txt"
