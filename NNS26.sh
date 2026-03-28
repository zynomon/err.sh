#!/bin/bash


echo "Which mirror would you like to use?: ( closer = faster )"
echo "1) Bangladesh (mirror.xeonbd.com)"
echo "2) United States (ftp.us.debian.org)"
echo "3) Germany (ftp.de.debian.org)"
echo "4) United Kingdom (ftp.uk.debian.org)"
echo "5) Japan (ftp.jp.debian.org)"
echo "6) Australia (ftp.au.debian.org)"
echo "7) Standard (deb.debian.org)"
read -t 20 -p "Enter choice (1-7, default 7 after 20s): " MIRROR_CHOICE

case $MIRROR_CHOICE in
    1) MIRROR="http://mirror.xeonbd.com/debian/" 
       echo "Using Bangladeshi mirror" ;;
    2) MIRROR="http://ftp.us.debian.org/debian/" 
       echo "Using US mirror" ;;
    3) MIRROR="http://ftp.de.debian.org/debian/" 
       echo "Using German mirror" ;;
    4) MIRROR="http://ftp.uk.debian.org/debian/" 
       echo "Using UK mirror" ;;
    5) MIRROR="http://ftp.jp.debian.org/debian/" 
       echo "Using Japanese mirror" ;;
    6) MIRROR="http://ftp.au.debian.org/debian/" 
       echo "Using Australian mirror" ;;
    *) MIRROR="http://deb.debian.org/debian/" 
       echo "Using standard Debian mirror" ;;
esac

sudo tee /etc/apt/sources.list > /dev/null << EOF
deb $MIRROR trixie main contrib non-free non-free-firmware
deb-src $MIRROR trixie main contrib non-free non-free-firmware
deb http://security.debian.org/ trixie-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/ trixie-security main contrib non-free non-free-firmware
deb $MIRROR trixie-updates main contrib non-free non-free-firmware
deb-src $MIRROR trixie-updates main contrib non-free non-free-firmware
deb $MIRROR trixie-backports main contrib non-free non-free-firmware
deb-src $MIRROR trixie-backports main contrib non-free non-free-firmware
EOF

sudo rm -f /etc/apt/sources.list.d/debian-live-media.list
sudo apt-get update
sudo apt remove -y --purge calamares calamares-settings-error partitionmanager squashfs-tools live-task-recommended live-task-localisation live-boot live-boot-doc live-config live-config-doc live-config-systemd live-tools 
sudo apt install once -y && /bin/once ; sudo apt remove once -y
sudo apt autoremove -y

echo "thanks for using"

exit 0
