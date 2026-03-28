#!/bin/bash

sudo rm -f /etc/apt/sources.list.d/debian-live-media.list
sudo apt-get update
sudo apt remove -y --purge calamares calamares-settings-error partitionmanager squashfs-tools live-task-recommended live-task-localisation live-boot live-boot-doc live-config live-config-doc live-config-systemd live-tools 
sudo apt install once -y && /bin/once ; sudo apt remove once -y
sudo apt autoremove -y


echo "thanks for using"
