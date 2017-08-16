#!/bin/bash
## SUDO CHECK ------------------------------------------------------------------
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
## -----------------------------------------------------------------------------

## OS CHECK --------------------------------------------------------------------
platform=0
if [ "$(uname)" == "Darwin" ]; then
    platform='mac'
    echo 'Sorry, no mac script yet.'
    exit 0
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    platform='linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    platform='windows'
    echo 'Sorry, no windows script yet.'
    exit 0
fi
echo '--> '$platform
echo 'pwd='$(pwd)
ORIG_DIR=$(pwd)
echo $(which python3)
echo $(which python)
echo $(which pip)
source ~/.bash_profile
echo $(which python3)
echo $(which python)
echo $(which pip)
## -----------------------------------------------------------------------------

## Build from scratch baby
# CPU-src: https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.devel
## Set up Bazel.
cd $ORIG_DIR
echo "startup --batch" >> /etc/bazel.bazelrc
echo "build --spawn_strategy=standalone --genrule_strategy=standalone" >> /etc/bazel.bazelrc
export BAZEL_VERSION=0.5.0
export BAZEL_DIR="$(pwd)"/bazel
mkdir -p $BAZEL_DIR && \
    cd $BAZEL_DIR && \
    curl -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36" -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    curl -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36" -fSsL -o $BAZEL_DIR/LICENSE.txt https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE && \
    chmod +x bazel-*.sh && \
    ./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    cd / && \
    rm -f $BAZEL_DIR/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh

# Download and build TensorFlow.
cd $ORIG_DIR
export TF_DIR=$(pwd)/tensorflow
git clone https://github.com/tensorflow/tensorflow.git $TF_DIR && \
    cd $TF_DIR && \
    git checkout r1.3
cd $TF_DIR
export CI_BUILD_PYTHON=/opt/intel/intelpython35/bin//python3
tensorflow/tools/ci_build/builds/configured CPU \
    bazel build -c opt --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" \
        tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/pip && \
    pip --no-cache-dir install --upgrade /tmp/pip/tensorflow-*.whl && \
    rm -rf /tmp/pip && \
    rm -rf /root/.cache

# GPU-src: https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.devel-gpu