#!/bin/bash

sudo echo 'install vagrant...'
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo <<'EOL' | sudo tee /etc/apt/sources.list.d/hashicorp.sources
Types: deb
URIs: https://apt.releases.hashicorp.com/
Components: main
Signed-By: /usr/share/keyrings/hashicorp-archive-keyring.gpg
EOL

sudo apt update && sudo apt install -y vagrant

sudo sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources
sudo apt install -y nfs-kernel-server
sudo systemctl enable --now nfs-server
sudo apt build-dep ruby-libvirt
sudo apt install -y ebtables dnsmasq-base
sudo apt install -y install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev unzip

vagrant plugin install vagrant-libvirt