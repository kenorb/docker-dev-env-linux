FROM ubuntu:latest
MAINTAINER kenorb
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common apt-utils
RUN add-apt-repository ppa:apt-fast/stable
RUN apt-get update
RUN apt-get install -y apt-fast
RUN apt-fast install -y wget curl build-essential coreutils bsdmainutils
RUN apt-fast install -y git 
RUN apt-fast install -y colordiff
