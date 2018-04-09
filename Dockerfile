FROM ansible/ansible:ubuntu1604py3
MAINTAINER kenorb
ENV DEBIAN_FRONTEND noninteractive
RUN pip3 install ansible
RUN printf '[local]\r\nlocalhost ansible_python_interpreter="env python3"\r\n' > /etc/ansible/hosts
ADD ansible /ansible
RUN ansible-playbook /ansible/provision.yml -c local
#RUN printf "APT::Install-Recommends 0;\r\nAPT::Install-Suggests 0;\r\n" > /etc/apt/apt.conf.d/01norecommend
#RUN apt-get install -qy wget curl coreutils bsdmainutils
#RUN apt-get install -qy vim git colordiff
