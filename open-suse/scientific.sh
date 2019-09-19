#!/bin/bash
echo "Configuring $(uname -r) with Scientific Packages"

# Editors
echo "Julia"
sudo zypper install -y julia

# Engineering and Scientific
echo "Astronomy"
sudo zypper install -y stellarium

# C++ Scientific Libraries
sudo zypper install -y gsl gsl-devel eigen3 eigen3-devel \
        lapack lapack-devel lapack-devel-static \
        opencv3 opencv3-devel libmop libmop-devel

# Python libs
pip3 install astropy numpy scipy matplotlib ipython jupyter pandas sympy nose --user
