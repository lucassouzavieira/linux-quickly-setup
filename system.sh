#!/bin/bash
echo "Configuring $(uname -r) environment"

# Full system upgrade
sudo dnf update -y

# Hostname
sudo hostnamectl set-hostname r5s

# RPM-Fusion repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf check-update

# Basic apps
sudo dnf install -y rhythmbox gimp tlp \
        vlc VirtualBox ntfs-3g \
        fuse-exfat youtube-dl htop \
        screenfetch qbittorrent \
        unzip p7zip flameshot

# Enable TLP
sudo tlp start
sudo systemctl enable tlp

# Media codecs & Spotify
sudo dnf install -y gstreamer1-plugin-openh264 \
        gstreamer1-plugins-bad-free \
        gstreamer1-plugins-bad-freeworld \
        gstreamer1-plugins-bad-nonfree gstreamer1-plugins-base \
        gstreamer1-plugins-good gstreamer1-plugins-good-gtk \
        gstreamer1-plugins-ugly gstreamer1-plugins-ugly-free

sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
sudo dnf install spotify-client

# Development Tools (C/C++/Java/Haskell)
echo "Development tools (C/C++/Java/Haskell)"
sudo dnf group install -y "C Development Tools and Libraries"
sudo dnf group install -y "Development Libraries"
sudo dnf group install -y "Development Tools"
sudo dnf group install -y "Java"
sudo dnf group install -y "Java Development"
sudo dnf group install -y "Haskell"

# Golang
sudo dnf install golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
source $HOME/.bashrc
go env GOPATH