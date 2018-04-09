FROM ubuntu:latest
MAINTAINER kenorb
ENV DEBIAN_FRONTEND noninteractive
RUN printf "APT::Install-Recommends 0;\r\nAPT::Install-Suggests 0;\r\n" > /etc/apt/apt.conf.d/01norecommend
RUN apt-get update
RUN apt-get install -qy software-properties-common apt-utils
RUN add-apt-repository ppa:apt-fast/stable
RUN apt-get update
RUN apt-get install -qy apt-fast
RUN apt-fast install -qy wget curl build-essential coreutils bsdmainutils
RUN apt-fast install -qy vim git colordiff
