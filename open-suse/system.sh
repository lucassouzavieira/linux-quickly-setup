#!/bin/bash
echo "Configuring $(uname -r) environment"

# Full system upgrade
sudo zypper update

# Hostname
sudo hostnamectl set-hostname r5s

# Packman repositories
sudo zypper ar -p 1 -f -n packman http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
sudo zypper check-update

# Basic apps
sudo zypper install -y rhythmbox gimp tlp \
        vlc ntfs-3g \
        fuse-exfat youtube-dl htop \
        screenfetch \
        unzip p7zip flameshot

# Enable TLP
sudo tlp start
sudo systemctl enable tlp

# Media codecs
sudo zypper install -y x264 ffmpeg \
        gstreamer-plugins-libav gstreamer-plugins-ugly 

# Snap & Spotify
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed snappy
sudo zypper refresh
sudo zypper install -y snapd
source /etc/profile
sudo systemctl enable snapd
sudo systemctl start snapd
snap install spotify

# Development Tools (C/C++/Java/Python/Ruby)
echo "Development tools (C/C++/Java/Python/Ruby)"
sudo zypper in -t pattern devel_basis
sudo zypper in -t pattern devel_C_C++
sudo zypper in -t pattern devel_kernel
sudo zypper in -t pattern devel_java
sudo zypper in -t pattern devel_python3
sudo zypper in -t pattern devel_ruby

# Golang
sudo zypper in go go-doc