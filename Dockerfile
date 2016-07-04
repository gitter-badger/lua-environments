FROM phusion/baseimage-docker
MAINTAINER Alban Linard <alban@linard.fr>

# Install dependencies:
RUN apt-get update
RUN apt-get --yes install sudo curl git python python-pip zip unzip
RUN apt-get --yes install libreadline-dev libncurses5-dev libssl-dev
RUN apt-get --yes install lua luarocks
RUN pip install hererocks

# Install lua environments:
ADD install /lua/install
RUN chown -R root.users /lua
RUN cd /lua/ && ./install
RUN chown -R root.users /lua

# Clean up APT:
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
