#!/bin/bash
## SUDO CHECK ------------------------------------------------------------------
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
## -----------------------------------------------------------------------------

## OS CHECK --------------------------------------------------------------------
platform=0
if [ "$(uname)" == "Darwin" ]; then
    platform='mac'
    echo 'Sorry, no windows script yet.'
    exit 0
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    platform='linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    platform='windows'
    echo 'Sorry, no windows script yet.'
    exit 0
fi
echo '--> '$platform
## -----------------------------------------------------------------------------

## JULIA INSTALL ---------------------------------------------------------------
add-apt-repository -y ppa:staticfloat/julia-deps
add-apt-repository -y ppa:staticfloat/julianightlies
apt-get -y install julia
## -----------------------------------------------------------------------------