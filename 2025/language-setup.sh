#!/bin/bash

sudo echo 'Setup Language...'
cat << EOL | sudo tee /etc/apt/apt.conf.d/00-no-install-recommends

APT::Install-Recommends 0;
APT::Install-Suggests 0;
EOL

sudo apt update && sudo apt upgrade -y
sudo apt install -y language-pack-ja language-pack-gnome-ja
sudo apt install -y fonts-noto-cjk
sudo apt install -y fcitx5 fcitx5-config-qt fcitx5-data fcitx5-frontend-all fcitx5-mozc
sudo im-config -n fcitx5
im-config -n fcitx5
sudo apt install -y gnome-shell-extension-manager

echo 'rebooting...'
sleep 3
sudo reboot