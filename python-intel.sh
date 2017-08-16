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

## PYTHON INSTALL --------------------------------------------------------------
echo '--> Getting python...' # my serial number: CTGC-V68SLW48
check=$(which python3)
python_name=python35
if [ $check == '/opt/intel/intelpython35/bin//python3' ]; then
  echo "** got python already! **"
else
  if [ $platform == 'linux' ] && [ '$(which python3)' != '/opt/intel/intelpython35/bin//python3' ]; then
    curl -L http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11602/l_python3_pu3_2017.3.052.tgz -o ${python_name}.tgz
    installdir=./l_python3_pu3_2017.3.052
  elif [ $platform == 'mac' ] && [ '$(which python3)' != '/opt/intel/intelpython35/bin//python3' ]; then
    curl -L http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11607/intelpython35-2017.3.053.tgz -o ${python_name}.tgz
    installdir=./intelpython35-2017.3.053.app/Contents/MacOS
  fi
  chmod 777 ${python_name}.tgz
  tar -xzvf ${python_name}.tgz
  sed -i -e 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/' ${installdir}/silent.cfg
  sed -i -e 's/COMPONENTS=DEFAULTS/COMPONENTS=ALL/' ${installdir}/silent.cfg
  ${installdir}/install.sh --silent ${installdir}/silent.cfg
  printf "PATH=/opt/intel/intelpython3/bin/:\$PATH \n" >> ~/.bash_profile
  # printf "export PATH \n" >> ~/.bash_profile # is this needed? NO.
  source ~/.bash_profile
fi
## -----------------------------------------------------------------------------