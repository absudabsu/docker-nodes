# apt-get update --fix-missing
# apt-get install -y --fix-missing apt-utils dialog locate linux-generic linux-headers-generic cpio libreadline-dev libncurses5-dev htop
# apt-get install -y --fix-missing build-essential gcc gpp make cmake libboost-all-dev
# apt-get install -y --fix-missing ca-certificates git curl wget vim unzip python-dev   
# # libdc1394-22-dev
# DEBIAN_FRONTEND=noninteractive

apt-get update --fix-missing
apt-get install -y --fix-missing apt-utils dialog locate cpio htop # first, some admin utilities
apt-get install -y --fix-missing libreadline-dev libncurses5-dev # handle writing to the screen
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing linux-generic linux-headers-generic # kernel headers
apt-get install -y --fix-missing build-essential gcc gpp make cmake pkg-config libboost-all-dev # compiler utils
apt-get install -y --fix-missing ca-certificates git curl wget vim unzip python-dev npm # some basic utils
apt-get install -y --fix-missing software-properties-common python-software-properties # lets you add-apt-repository

# multimedia supoprt
apt-get install -y libtbb2 libtbb-dev libjpeg8-dev libtiff5-dev libpng12-dev libdc1394-22-dev # img #libjasper, jasper?
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev # video

# matrix operations
apt-get install -y libatlas-base-dev gfortran