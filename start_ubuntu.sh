DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing apt-utils dialog locate cpio htop zsh sed # first, some admin utilities
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing libreadline-dev libncurses5-dev # handle writing to the screen
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing linux-generic linux-headers-generic # kernel headers
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing build-essential gcc gpp make cmake autoconf automake pkg-config libboost-all-dev # compiler utils
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing ca-certificates git curl wget vim unzip python-dev npm # some basic utils
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing software-properties-common python-software-properties # lets you add-apt-repository

DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get -y build-dep blender  # multimedia supoprt
DEBIAN_FRONTEND=noninteractive apt-get install -y libatlas-base-dev gfortran # matrix operations

DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade