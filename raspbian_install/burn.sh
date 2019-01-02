#!/bin/bash
source env.sh

export ETCHER_DISK=/dev/sda

#sudo $ETCHER_BINARY -d $ETCHER_DISK $(ls downloads/*.img)

# Mount boot partition
if [ ! -d boot ]; then mkdir boot; fi
sudo mount ${ETCHER_DISK}1 boot

sudo printf "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
network={
    ssid=\"$(cat .wifi_ssid)\"
    psk=\"$(cat .wifi_password)\"
    key_mgmt=WPA-PSK
}" > wpa_supplicant.conf

if [ $(cat /proc/mounts | grep -c $PWD/boot) -gt 0 ]; then 
    cd boot
    sudo touch ssh
    mv ../wpa_supplicant.conf .
    cd ..
    sudo umount boot
fi
