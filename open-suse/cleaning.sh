#!/bin/bash
echo "Cleaning $(uname -r) environment"


echo "Flatpack unused packages:"
flatpak uninstall --unused

echo "journalctl old logs:"
sudo journalctl --vacuum-time=2d

echo "snap unused packages:"
set -eu

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

echo "zypper cache:"
sudo zypper clean
