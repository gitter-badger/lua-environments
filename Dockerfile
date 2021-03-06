FROM debian:testing
MAINTAINER Alban Linard <alban@linard.fr>

ADD install /lua/install
RUN apt-get update && \
    apt-get --yes install libreadline-dev libncurses5-dev libssl-dev git luarocks python python-pip curl && \
    luarocks install luasec && \
    pip install hererocks && \
    cd /lua/ && ./install && cd .. && \
    chown -R root.users /lua && \
    apt-get --yes remove --purge python python-pip && \
    apt-get --yes autoremove && \
    apt-get clean && \
    rm -rf /lua/install /var/lib/apt/lists/* /tmp/* /var/tmp/*
