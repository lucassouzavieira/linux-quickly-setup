#!/bin/bash
echo "Configuring $(uname -r) for Web Development (PHP / Python / Ruby)"

# Apache & Git
echo "Apache HTTP Server"
sudo zypper install -y apache2

echo "Git configuration"
git config --global user.name "Lucas S. Vieira"
git config --global user.email "lucassouzavieiraengcomp@gmail.com"

# PHP Environment
echo "PHP Environment"
sudo zypper install -y php7 php7-mysql apache2-mod_php7 \
        php7-APCu php7-pdo php7-dba php7-fastcgi php7-devel \
        php7-pgsql php7-fpm php7-opcache \
        php7-memcached php7-gd php7-zip php7-json \
        php7-mbstring php7-xmlrpc php7-uuid php7-mysql

sudo a2enmod php7

# Python Environment
echo "Python Environment"
sudo zypper install -y readline-devel sqlite3-devel libbz2-devel zlib-devel libopenssl-devel libffi-devel python3-devel
sudo zypper install -y python3-virtualenv

# Ruby Environment
echo "Ruby Environment"
sudo zypper ar http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_15.0/ devel:languages:ruby:extensions 
sudo zypper refresh
sudo zypper install -y automake gdbm-devel libyaml-devel ncurses-devel readline-devel zlib-devel ruby ruby-devel
gem install rails

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh
sudo zypper install -y code