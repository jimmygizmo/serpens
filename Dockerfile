####################################################################################################
# Atomonova Ubuntu Serpens Dockerfile - Fri May 20 18:26:23 PDT 2022 - v.0.0.9
# Ubuntu 20.04 is the latest LTS release
####################################################################################################

FROM ubuntu:20.04

####################################################################################################
# Show OS details.
RUN cat /etc/os-release
RUN cat /etc/lsb-release
RUN cat /etc/debian_version
RUN cat /proc/version


####################################################################################################
# Update apt package information from all configured sources.
RUN apt-get -y update


####################################################################################################
# Install basic tools for working in the shell.
####################################################################################################


####################################################################################################
# vim
# Install vim/vi.
RUN apt-get -y install vim
RUN vim --version
# VIM - Vi IMproved 8.1 (2018 May 18, compiled Feb 01 2022 09:16:32)

# Installs packages:  alsa-topology-conf alsa-ucm-conf file libasound2 libasound2-data
#   libcanberra0 libexpat1 libgpm2 libltdl7 libmagic-mgc libmagic1 libmpdec2
#   libogg0 libpython3.8 libpython3.8-minimal libpython3.8-stdlib libreadline8
#   libsqlite3-0 libssl1.1 libtdb1 libvorbis0a libvorbisfile3 mime-support
#   readline-common sound-theme-freedesktop vim vim-common vim-runtime xxd
#   xz-utils
# 0 upgraded, 30 newly installed, 0 to remove and 10 not upgraded.
# Adds: 70.6 MB


####################################################################################################
# ping
# Install ping to test connectivity to other hosts.
RUN apt-get -y install iputils-ping
RUN ping -V
# ping from iputils s20190709

# Installs packages:  iputils-ping libcap2 libcap2-bin libpam-cap
# 0 upgraded, 4 newly installed, 0 to remove and 10 not upgraded.
# Adds: 333 kB


####################################################################################################
# git
# Install git as some pip and source-code-built installs may need it.
RUN apt-get -y install git
RUN git --version
# git version 2.25.1

# Installs packages:  ca-certificates git git-man krb5-locales less libasn1-8-heimdal libbrotli1
#   libbsd0 libcbor0.6 libcurl3-gnutls libedit2 liberror-perl libfido2-1
#   libgdbm-compat4 libgdbm6 libgssapi-krb5-2 libgssapi3-heimdal
#   libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal
#   libhx509-5-heimdal libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3
#   libkrb5support0 libldap-2.4-2 libldap-common libnghttp2-14 libperl5.30
#   libpsl5 libroken18-heimdal librtmp1 libsasl2-2 libsasl2-modules
#   libsasl2-modules-db libssh-4 libwind0-heimdal libx11-6 libx11-data libxau6
#   libxcb1 libxdmcp6 libxext6 libxmuu1 netbase openssh-client openssl patch
#   perl perl-modules-5.30 publicsuffix xauth
# 0 upgraded, 53 newly installed, 0 to remove and 10 not upgraded.
# Adds: 105 MB

# NOTE: git is required to install Pyenv


####################################################################################################
# curl
# Install curl for development, testing and troubleshooting.
RUN apt-get -y install curl
RUN curl --version
# curl 7.68.0 (x86_64-pc-linux-gnu) libcurl/7.68.0 OpenSSL/1.1.1f zlib/1.2.11 brotli/1.0.7
#  libidn2/2.2.0 libpsl/0.21.0 (+libidn2/2.2.0) libssh/0.9.3/openssl/zlib nghttp2/1.40.0 librtmp/2.3
# Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp scp
#   sftp smb smbs smtp smtps telnet tftp
# Features: AsynchDNS brotli GSS-API HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM NTLM_WB
#   PSL SPNEGO SSL TLS-SRP UnixSockets

# Installs packages:  curl libcurl4
# 0 upgraded, 2 newly installed, 0 to remove and 10 not upgraded.
# Adds: 1121 kB


####################################################################################################
# strace
# Install strace for tracing system calls of a process.
RUN apt-get -y install strace
RUN strace --version
# strace -- version 5.5 - Enabled: stack-trace=libunwind stack-demangle m32-mpers mx32-mpers

# Installs packages:  libunwind8 strace
# 0 upgraded, 2 newly installed, 0 to remove and 10 not upgraded.
# Adds: 1844 kB


####################################################################################################
# sysstat
# Install the sysstat package for monitoring, collection and analysis of system performance
# metrics and activity. The systat package includes many tools, but the most commonly used
# are iostat, mpstat, pidstat and sar.
RUN apt-get -y install sysstat
RUN iostat -V
# sysstat version 12.2.0

# Installs packages:  cron libsensors-config libsensors5 sysstat ucf
# 0 upgraded, 5 newly installed, 0 to remove and 10 not upgraded.
# Adds: 2118 kB


####################################################################################################
# fix: tzdata installer
# During the following install of 'software-properties-common', at the step to install 'tzdata'
# the installer will stop for user input and thus break the build. This is the fix. 
ARG DEBIAN_FRONTEND=noninteractive


####################################################################################################
# software-properties-common
# The following dependency install of software-properties-common
# is needed because it includes the apt-add-repository command which we may run in a following step,
# but software-properties-common may also be needed for multiple other installs as it a common
# dependency. This adds additional package repository management commands, among other things.
RUN apt-get -y install software-properties-common

# Installs packages:  dbus dbus-user-session dconf-gsettings-backend dconf-service dirmngr
#   distro-info-data dmsetup gir1.2-glib-2.0 gir1.2-packagekitglib-1.0
#   glib-networking glib-networking-common glib-networking-services gnupg
#   gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpg-wks-server gpgconf
#   gpgsm gsettings-desktop-schemas iso-codes libapparmor1 libappstream4
#   libargon2-1 libassuan0 libcryptsetup12 libdbus-1-3 libdconf1
#   libdevmapper1.02.1 libelf1 libgirepository-1.0-1 libglib2.0-0 libglib2.0-bin
#   libglib2.0-data libgstreamer1.0-0 libicu66 libip4tc2 libjson-c4 libkmod2
#   libksba8 liblmdb0 libnpth0 libnss-systemd libpackagekit-glib2-18
#   libpam-systemd libpolkit-agent-1-0 libpolkit-gobject-1-0 libproxy1v5
#   libpython3-stdlib libsoup2.4-1 libstemmer0d libxml2 libyaml-0-2 lsb-release
#   networkd-dispatcher packagekit packagekit-tools pinentry-curses policykit-1
#   python-apt-common python3 python3-apt python3-certifi python3-chardet
#   python3-dbus python3-distro-info python3-gi python3-idna python3-minimal
#   python3-pkg-resources python3-requests python3-requests-unixsocket
#   python3-six python3-software-properties python3-urllib3 python3.8
#   python3.8-minimal shared-mime-info software-properties-common systemd
#   systemd-sysv systemd-timesyncd tzdata unattended-upgrades xdg-user-dirs
# The following packages will be upgraded:
#   libsystemd0
# 1 upgraded, 87 newly installed, 0 to remove and 9 not upgraded.
# Adds: 118 MB


####################################################################################################
# Obtain LSB details which may be needed for many common installs, such as for a full Postgres
# install, for example.
# Make note of the "codename" in the output which may be important for some installs.
# This command comes included with software-properties-common, which is why it is run here.
RUN lsb_release -a
# Description: Ubuntu 20.04.1 LTS - Codename: focal
# NOTE: Similar information is available with the command used earlier: cat /etc/lsb-release


####################################################################################################
# OPTIONAL: psql  (Remove all ##><## to enable installation.)
# Install 'psql', the Postgres command-line client, for administering the PostgreSQL DB.
RUN apt-get -y install postgresql-client
RUN psql --version
# psql (PostgreSQL) 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)

# Installs packages:  libpq5 postgresql-client postgresql-client-12 postgresql-client-common
# 0 upgraded, 4 newly installed, 0 to remove and 9 not upgraded.
# Adds: 4436 kB

####################################################################################################

# OLD.
# This would be a good place to install Python, but as of Ubuntu 20.04, Python is now included.
# Here we create a symlink so that the command 'python' will invoke this included Python 3.8.
#RUN ln -s /usr/bin/python3.8 /usr/bin/python


####################################################################################################
# pyenv
# This is a source install involving many steps, beginning with cloning the repository.
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# Pre-pend the path to Pyenv's bin onto the front of $PATH.
# This will cause Pyenv shim-controlled Python versions to override any other Python installations.

RUN echo '' >> ~/.profile;
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
RUN echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> ~/.profile
RUN echo '  eval "$(pyenv init -)"' >> ~/.profile
RUN echo 'fi' >> ~/.profile
RUN echo '' >> ~/.profile

# RUN echo '' >> ~/.bashrc;
# RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# RUN echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> ~/.bashrc
# RUN echo '  eval "$(pyenv init -)"' >> ~/.bashrc
# RUN echo 'fi' >> ~/.bashrc
# RUN echo '' >> ~/.bashrc

# Apply the above changes.
# The following source does not work. Root has issues sourcing such files.
##### DISABLED FOR NOW AS THIS BREAKS THE BUILD AS DOES BASHRC VERSION #####  RUN source ~/.profile
# RUN source ~/.bashrc

# TEST:
#### DID NOT WORK #### RUN eval "$(pyenv init -)"
#### RUN exec "$SHELL"  -- ERROR: Permission Denied

# exec "/bin/bash" does not error at all, and we have 'which' but there is no active 'pyenv'
#### RUN exec "/bin/bash"


# But this should work. The -l option creates a new login shell for root, hence the desired sourcing.
##### DISABLE FOR ABOVE TEST #####  RUN su -l

RUN which pyenv
# TODO: STILL NO RESOLUTION TO THE PROBLEM OF ROOT NOT BEING ABLE TO SOURCE .profile OR .bashrc
RUN pyenv -v
# pyenv 2.3.0-11-ge676fde9
RUN pyenv versions
# * system (set by /root/.pyenv/version)  -  Correctly shows we have not installed any additional yet.

# Show the current state of Python binaries. This will show only the Python 3 which was installed
# with software-properties-common
# python and python2 do not currently exist and there is no pip at all. (Known by inspecting image.)
RUN python3 -V

# Adds: 12 MB


####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################




####################################################################################################



##
#

