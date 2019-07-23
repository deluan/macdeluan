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
RUN apt-get -y install zip unzip
RUN apt-get -y install zsh
RUN apt-get -y install locales
RUN apt-get -y install direnv

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
ENV TERM=xterm-256color

RUN adduser --disabled-password --gecos '' --shell /bin/zsh deluan
RUN adduser deluan sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/deluan

# VOLUME "/home/deluan/.linuxshell"
# RUN mkdir -p .linuxshell/.fnm 
# RUN touch .linuxshell/.z .linuxshell/.zsh_history
# RUN ln -sf /home/deluan/.linuxshell/.z .z
# RUN ln -sf /home/deluan/.linuxshell/.fnm .fnm
# RUN ln -sf /home/deluan/.linuxshell/.zsh_history .zsh_history
# RUN chown -R deluan .linuxshell

USER deluan

ENV ZPLUG_HOME=/home/deluan/.zplug
RUN git clone --depth=1 https://github.com/zplug/zplug $ZPLUG_HOME
# RUN curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

RUN curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash

COPY .zshrc /home/deluan
RUN zsh -c "(source /home/deluan/.zshrc && zplug install)"

ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]
