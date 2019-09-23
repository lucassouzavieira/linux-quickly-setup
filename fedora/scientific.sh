#!/bin/bash
echo "Configuring $(uname -r) with Scientific Packages"

# Editors
echo "Editors"
sudo dnf group install -y "Editors"

# Engineering and Scientific
echo "Engineering and Scientific group"
sudo dnf group install -y "Engineering and Scientific"

# Apps
sudo dnf install -y celestia stellarium

# Engineering and Scientific
echo "Jupyter"
pip3 install jupyter --user

echo "Julia language"
sudo dnf install -y julia

# C++ Scientific Libraries
sudo dnf install -y astropy-tools gsl \
        gsl-devel eigen3 eigen3-devel \
        lapack lapack-devel lapack-static \
        opencv opencv-devel libmop libmop-devel

# Python libs
pip3 install astropy numpy scipy matplotlib ipython pandas sympy nose --user
