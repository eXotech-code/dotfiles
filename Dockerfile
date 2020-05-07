# container for testing my dotfiles
FROM archlinux:latest

COPY . /data
WORKDIR /data

RUN ./setup-archlinux.sh
RUN ./install.sh container


