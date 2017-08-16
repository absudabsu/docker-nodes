#!/bin/bash
source /root/.bash_profile
mkdir -p /srv/jupyterhub
cd /srv/jupyterhub
export JPY_COOKIE_SECRET=`openssl rand -hex 1024`
/opt/intel/intelpython3/bin//jupyterhub #--no-ssl