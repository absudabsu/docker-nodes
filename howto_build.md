1. get a local machine, run docker daemon, and pull latest base image:
    
    docker pull ubuntu:17.10
    
2. start a new session using that image.

    docker run --name=testenv -it !$ 
    
3. Run all the commands you want.

    ./start_ubuntu.sh
    
4. Assemble in a dockerfile:

    FROM ubuntu:17.10
    MAINTAINER First Last <firstlast@gmail.com>

    WORKDIR /root/setup/

    ADD start_ubuntu.sh /root/setup/
    RUN chmod +x /root/setup/start_ubuntu.sh && /root/setup/start_ubuntu.sh

    VOLUME /srv/
    VOLUME /home

    CMD ["/bin/bash"]
    
5. Trigger build, and use this as the base image.

    docker run --name=testenv -it sirgogo/base
