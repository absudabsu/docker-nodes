#!/bin/bash
## SUDO CHECK ------------------------------------------------------------------
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
## -----------------------------------------------------------------------------
echo '--> Getting python packages' # we have unity between pip and conda now :)
# our strategy is to use conda unless its not added yet, since it has better dependency resolution than pip

## update conda
conda update -y conda
conda config --prepend channels intel # adds to top of priority list
conda config --append channels conda-forge # adds to bottom of priority list
conda install -y conda

conda install -y numpy scipy matplotlib pandas sympy networkx # base (this should already be installed)

conda install -y readline setuptools six # cool stuff
pip install readline npm #just in case..

conda install -y h5py msgpack-python pyyaml # dataformats

conda install -y matplotlib bokeh plotly # viz

conda install -y scikit-image scikit-learn scikit-rf scikit-bio # toolkits

conda install -y beautifulsoup4 scrapy requests # web

conda install -y pyproj geopandas gdal # GIS (apt-get build-dep gdal ?, osgeo?)
pip install overpass

pip install pyrtl # ckts

conda install -y jupyter jupyterhub jupyterlab ipython ipyparallel mathjax # jupyter

conda install -y jupyter_contrib_nbextensions jupyter_nbextensions_configurator nbpresent # extensions
jupyter nbextension enable nbpresent --py
jupyter serverextension enable nbpresent --py
jupyter contrib nbextension install --symlink
ipcluster nbextension enable
jupyter serverextension enable --py jupyterlab
## -----------------------------------------------------------------------------

# openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem -batch
# jupyterhub --generate-config