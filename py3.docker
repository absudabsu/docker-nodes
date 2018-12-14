FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
MAINTAINER Abhejit Rajagopal <rajagopal.abhejit@gmail.com>

WORKDIR /root

RUN apt-get -y update --fix-missing && \
    apt-get -y install --no-install-recommends --fix-missing \
      apt-utils \
      autoconf \
      automake \
      build-essential \
      bzip2 \
      ca-certificates \
      cmake \
      cpio \
      curl \
      dialog \
      gcc \
      gfortran \
      git \
      gpp \
      g++ \
      htop \
      libatlas-base-dev \
      libav-tools \
      libboost-all-dev \
      libcupti-dev \
      libncurses5-dev \
      libreadline-dev \
      locate \
      make \
      npm \
      nodejs-legacy \
      pkg-config \
      python-dev \
      python-software-properties \
      sed \
      software-properties-common \
      ssh \
      tmux \
      unzip \
      vim \
      wget \
      zlib1g-dev \
      zsh && \
  rm -rf /var/lib/apt/lists/*

#Install MINICONDA
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && \
	rm Miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN conda update -y conda
RUN conda config --append channels conda-forge
RUN conda install -y python=3.6 \
      beautifulsoup4 \
      bokeh \
      conda-build \
      cython \
      gdal \
      geopandas \
      h5py \
      imageio \
      ipyparallel \
      ipython \
      jupyter_contrib_nbextensions \
      jupyter \
      jupyterhub \
      jupyterlab \
      jupyter_nbextensions_configurator \
      libiconv \
      matplotlib \
      msgpack-python \
      nbpresent \
      networkx \
      numpy \
      opencv=3 \
      pandas \
      pillow \
      plotly \
      pyproj \
      pyyaml \
      readline \
      requests \
      scikit-bio \
      scikit-image \
      scikit-learn \
      scikit-rf \
      scipy \
      scrapy \
      setuptools \
      six \
      sympy \
      tornado=4.5 \
      tomopy dxchange && \
    conda clean -tipsy

RUN jupyter nbextension enable --py nbpresent  && \
  jupyter serverextension enable --py nbpresent && \
  jupyter serverextension enable --py jupyterlab --sys-prefix && \
  jupyter contrib nbextension install --symlink && \
  ipcluster nbextension enable

RUN which pip
RUN pip install laspy Tyf
RUN pip install jax jaxlib tensorflow-gpu jupyter-tensorboard

#RUN apt-get update # && apt-get install -y julia
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.0-linux-x86_64.tar.gz && tar xvfa julia-1.0.0-linux-x86_64.tar.gz
ENV PATH /root/julia-1.0.0/bin:$PATH
RUN mkdir -p ~/.julia/config/ && echo "using Pkg" >> ~/.julia/config/startup.jl

SHELL ["/bin/zsh", "-c"]
CMD ["jupyter-lab", "--ip=0.0.0.0", "--allow-root"]
