FROM ubuntu:14.04
MAINTAINER Alban Linard <alban@linard.fr>

RUN apt-get update
RUN apt-get --yes install sudo git python python-pip
RUN pip install hererocks

ADD . /home/lua/
RUN chown -R root.users /home/lua

RUN cd /home/lua/ && ./bin/test-environment
RUN chown -R root.users /home/lua
