#!/bin/bash
## SUDO CHECK ------------------------------------------------------------------
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
## -----------------------------------------------------------------------------

## OS CHECK --------------------------------------------------------------------
platform=0
if [ "$(uname)" == "Darwin" ]; then
    platform='mac'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    platform='linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    platform='windows'
    echo 'Sorry, no windows script yet.'
    exit 0
fi
echo '--> '$platform
## -----------------------------------------------------------------------------

#tensorflow (latest and greatest in pip NOT conda!)
if [ $platform == 'linux' ]; then
  export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.2.1-cp35-cp35m-linux_x86_64.whl
elif [ $platform == 'mac' ]; then
  export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.2.1-py3-none-any.whl
fi
pip install --upgrade --ignore-installed $TF_BINARY_URL