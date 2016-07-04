FROM debian:testing
MAINTAINER Alban Linard <alban@linard.fr>

ADD install /lua/install
RUN apt-get update; \
    apt-get --yes install sudo curl git python python-pip zip unzip; \
    apt-get --yes install libreadline-dev libncurses5-dev libssl-dev; \
    apt-get --yes install lua luarocks; \
    pip install hererocks; \
    mkdir /lua; \
    cd /lua/; ./install; cd ..; \
    chown -R root.users /lua; \
    pip uninstall hererocks; \
    apt-get clean; \
    apt-get remove --purge -y python python-pip; \
    rm -rf /lua/install /var/lib/apt/lists/* /tmp/* /var/tmp/*;
