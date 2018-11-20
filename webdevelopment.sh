#!/bin/bash
echo "Configuring $(uname -r) for Web Development (PHP / Python / Ruby)"

# Apache & Git
echo "Apache & Git"
sudo dnf install -y httpd git
git config --global user.name "Lucas S. Vieira"
git config --global user.email "lucassouzavieiraengcomp@gmail.com"

# PHP Environment
echo "PHP Environment"
sudo dnf install -y php php-common php-pecl-apcu php-cli \
        php-pear php-pdo php-mysqlnd \
        php-pgsql php-pecl-mongodb php-pecl-memcache \
        php-pecl-memcached php-gd \
        php-mbstring php-mcrypt php-xml

# Python Environment
echo "Python Environment"
sudo dnf install -y python-devel
sudo dnf group install -y "Python"

# Ruby Environment
echo "Ruby Environment"
sudo dnf install -y ruby ruby-devel zlib-devel 
gem install rails

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

# Postgres Database Environment
echo "PostgreSQL Database"
sudo dnf group install -y "PostgreSQL Database"
