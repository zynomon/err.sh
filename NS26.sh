!/bin/bash
echo "run this before installation"
sudo sed -i '/^[[:space:]]*libpwquality:/,$ s/^/#/' /usr/share/calamares/modules/users.conf
sudo apt update && sudo apt install squashfs-tools
