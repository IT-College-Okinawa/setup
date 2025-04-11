#!/bin/bash

sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo systemctl enable --now libvirtd

sudo adduser "$(id -un)" libvirt
sudo adduser "$(id -un)" kvm