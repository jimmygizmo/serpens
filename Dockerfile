#
# Fri May 20 18:26:23 PDT 2022
# Ubuntu 20.04 is the latest LTS release
#

FROM ubuntu:20.04


# Show OS details
RUN cat /etc/os-release
RUN cat /etc/lsb-release
RUN cat /etc/debian_version
RUN cat /proc/version


# Update apt package information from all configured sources
RUN apt-get -y update


# Install basic tools for working in the shell.



Install vim/vi.
RUN apt-get -y install vim
RUN vim --version
# TODO: VIM - Vi IMproved 8.1 (2018 May 18, compiled Apr 15 2020 06:40:31)



##
#

