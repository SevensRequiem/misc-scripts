#!/bin/bash

echo "new server name:"
read name

hostnamectl set-hostname $name

current_ip=$(ip addr show ens18 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

echo "current IP: $current_ip"
echo "new server IP:"
read new_ip

echo "network:
    version: 2
    renderer: networkd
    ethernets:
        ens18:
            dhcp4: no
            addresses:
                - $new_ip/24" > /etc/netplan/01-netcfg.yaml
netplan apply

echo "Server name and IP have been updated."
echo "new server name: $name"
echo "new server IP: $new_ip"
