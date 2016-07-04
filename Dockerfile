FROM debian:testing
MAINTAINER Alban Linard <alban@linard.fr>

ADD install /lua/install
RUN apt-get update; \
    apt-get --yes install libreadline-dev libncurses5-dev libssl-dev; \
    apt-get --yes install lua5.3 luarocks python python-pip; \
    pip install hererocks; \
    cd /lua/; ./install; cd ..; \
    chown -R root.users /lua; \
    apt-get remove --purge -y python python-pip; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /lua/install /var/lib/apt/lists/* /tmp/* /var/tmp/*;
