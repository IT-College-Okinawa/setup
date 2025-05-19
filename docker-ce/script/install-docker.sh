#!/bin/bash

echo 'Install docker...'
sudo apt remove --auto-remove --purge \
    docker.io \
    docker-doc \
    docker-compose \
    docker-compose-v2 \
    podman-docker \
    containerd \
    runc

suudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
            -o /etc/apt/keyrings.docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
cat << EOF | sudo tee /etc/apt/sources.list.d/docker.sources
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: noble
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
sudo apt install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    docker-ce-rootless-extras \
    uidmap \
    slirp4netns

sudo apt install dbus-user-session
sudo apt install systemd-container

dockerd-rootless-setuptool.sh install

sudo mkdir -p /etc/systemd/system/user@.service.d/delegate.conf
cat << EOF | sudo tee /etc/systemd/system/user@.service.d/delegate.conf
[Service]
Delegate=cpu cpuset io memory pids
EOF
sudo systemctl daemon-reload
systemctl --user restart docker