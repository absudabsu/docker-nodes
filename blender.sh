#!/bin/bash
## SUDO CHECK ------------------------------------------------------------------
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
## -----------------------------------------------------------------------------

# source /root/.bash_profile
git clone http://git.blender.org/blender.git
cd blender
git submodule update --init --recursive
git submodule foreach git checkout master
git submodule foreach git pull --rebase origin master

# apt-get -y build-dep blender # need to prune this to disclude python3! as long as python3 is in the path, it will install to that version!
apt-get -y install autoconf automake autopoint bsdmainutils debhelper dh-autoreconf dh-strip-nondeterminism gdal-data gettext groff-base intltool-debian libaec0 libalut-dev libalut0
  libarchive-zip-perl libarmadillo7 libasound2 libasound2-data libasound2-dev libass9 libasyncns0 libavc1394-0 libavdevice-dev libavdevice57 libavfilter-dev libavfilter6
  libavresample-dev libavresample3 libblosc1 libbs2b0 libcaca-dev libcaca0 libcapnp-0.5.3 libcdio-cdda1 libcdio-paranoia1 libcdio13 libcroco3 libdap25 libdapclient6v5 libdrm-dev
  libegl1-mesa libepsilon1 libexif12 libfftw3-bin libfftw3-dev libfftw3-long3 libfftw3-quad3 libfile-stripnondeterminism-perl libflac-dev libflac8 libflite1 libfontconfig1-dev
  libfreetype6-dev libfreexl1 libfribidi0 libfyba0 libgbm1 libgd3 libgdal20 libgeos-3.5.1 libgeos-c1v5 libgeotiff2 libgettextpo-dev libgettextpo0 libgif7 libgl1-mesa-dev
  libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglew-dev libglew2.0 libglib2.0-bin libglib2.0-dev libglib2.0-dev-bin libglu1-mesa libglu1-mesa-dev libgphoto2-6
  libgphoto2-port12 libgraphite2-3 libgsm1-dev libharfbuzz0b libhdf4-0-alt libhdf5-100 libiec61883-0 libilmbase-dev libilmbase12 libjack-dev libjack0 libjemalloc-dev libjemalloc1
  libjpeg-dev libjpeg-turbo8-dev libjpeg8-dev libjson-c3 libkmlbase1 libkmldom1 libkmlengine1 liblcms2-2 liblog4cplus-1.1-9 liblzo2-dev libminizip1 libmirclient9 libmircommon7
  libmircore1 libmirprotobuf3 libmysqlclient20 libnetcdf11 libnspr4 libnss3 libodbc1 libogdi3.2 libogg-dev libopenal-data libopenal-dev libopenal1 libopencolorio-dev
  libopencolorio1v5 libopencv-core3.1 libopencv-imgcodecs3.1 libopencv-imgproc3.1 libopencv-videoio3.1 libopenexr-dev libopenexr22 libopenimageio-dev libopenimageio-doc
  libopenimageio1.6 libopenjp2-7-dev libopenvdb-dev libopenvdb3.2 libpcre16-3 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpgm-5.2-0 libpipeline1 libpoppler64 libpostproc-dev
  libpostproc54 libpq5 libproj12 libprotobuf-lite10 libpthread-stubs0-dev libpulse-dev libpulse-mainloop-glib0 libpulse0 libqhull7 libraw16 librubberband2v5 libsamplerate0
  libsdl1.2-dev libsdl1.2debian libsdl2-2.0-0 libsigsegv2 libslang2 libslang2-dev libsndfile1 libsndfile1-dev libsndio6.1 libsodium18 libspatialite7 libspnav-dev libspnav0
  libsuperlu5 libsz2 libtiff5-dev libtimedate-perl libtinyxml2.6.2v5 liburiparser1 libvorbis-dev libwayland-client0 libwayland-cursor0 libwayland-egl1-mesa libwayland-server0
  libwrap0 libx11-dev libx11-xcb-dev libxau-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-present-dev libxcb-randr0 libxcb-randr0-dev libxcb-render0-dev
  libxcb-shape0 libxcb-shape0-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb1-dev libxcursor1 libxdamage-dev libxdamage1 libxdmcp-dev libxerces-c3.1 libxext-dev libxfixes-dev
  libxi-dev libxi6 libxinerama1 libxkbcommon0 libxml2-dev libxpm4 libxrandr2 libxshmfence-dev libxss1 libxv1 libxxf86vm-dev libxxf86vm1 libyaml-cpp0.3v5 libzmq5 libzstd1 m4 man-db
  mesa-common-dev mysql-common odbcinst odbcinst1debian2 opencollada-dev po-debconf proj-data uuid-dev x11-common x11proto-core-dev x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev x11proto-input-dev x11proto-kb-dev
  x11proto-xext-dev x11proto-xf86vidmode-dev xkb-data xorg-sgml-doctools xtrans-dev  # python3-certifi python3-chardet python3-idna python3-pkg-resources python3-requests
  python3-six python3-urllib3
# build_files/build_environment/install_deps.sh --with-all --skip-osl # this actually should work on Fedora, but NOT on debian

apt-get -y install libjpeg62 libjpeg62-dev libjpeg-progs

make bpy