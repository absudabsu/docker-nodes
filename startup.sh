#!/bin/bash
source /root/.bash_profile
ls
cd /srv/
export JPY_COOKIE_SECRET=`openssl rand -hex 1024`
/opt/intel/intelpython35/bin//jupyterhub #--no-ssl