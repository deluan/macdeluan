FROM ubuntu

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install sudo
RUN apt-get -y install wget
RUN apt-get -y install ssh
RUN apt-get -y install tmux
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt-get -y install make

RUN adduser --disabled-password --gecos '' deluan
RUN adduser deluan sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER deluan
WORKDIR /home/deluan

RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
RUN ~/.bash_it/install.sh --silent
RUN rm .bashrc.bak
RUN sed -i -e 's/bobby/powerline/g' .bashrc
RUN sed -i -e 's/SCM_CHECK\=true/SCM_CHECK=false/g' .bashrc

RUN curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash
RUN echo 'source ~/.iterm2_shell_integration.bash' >> .bashrc