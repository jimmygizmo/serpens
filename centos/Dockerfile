####################################################################################################
# Atomonova CentOS Serpens Dockerfile - Mon May 23 03:05:42 PDT 2022 - v.0.0.9
# Centos 7 is the last major release supported by RedHat. Support ends in 2024.
# CentOS Serpens may be replaced with another distribution depending on RedHat/CentOS developments.
####################################################################################################

FROM centos:centos7.9.2009
# 75.15 MB


####################################################################################################
# Show OS details.
RUN cat /etc/centos-release
# CentOS Linux release 7.9.2009 (Core)
RUN cat /proc/version
# Linux version 5.10.104-linuxkit (root@buildkitsandbox) (gcc (Alpine 10.2.1_pre1) 10.2.1 20201203,
# GNU ld (GNU Binutils) 2.35.2) #1 SMP Thu Mar 17 17:08:06 UTC 2022


RUN yum --assumeyes update
# TODO: There was some issue when this was attempted with the -y option. Check again as it is a mystery.
#  Hence why this is the only place I use --assumeyes instead of -y.
# TODO: Consider  - shall we lock versions? Is the best way just to freeze an image once it is all
# worked out in the Dockerfile? Probably so. Impossible to lock versions on everything in updates.

# Updated:
#   bash.x86_64 0:4.2.46-35.el7_9                             bind-license.noarch 32:9.11.4-26.P2.el7_9.9
#   binutils.x86_64 0:2.27-44.base.el7_9.1                    ca-certificates.noarch 0:2021.2.50-72.el7_9
#   centos-release.x86_64 0:7-9.2009.1.el7.centos             coreutils.x86_64 0:8.22-24.el7_9.2
#   curl.x86_64 0:7.29.0-59.el7_9.1                           cyrus-sasl-lib.x86_64 0:2.1.26-24.el7_9
#   device-mapper.x86_64 7:1.02.170-6.el7_9.5                 device-mapper-libs.x86_64 7:1.02.170-6.el7_9.5
#   expat.x86_64 0:2.1.0-14.el7_9                             glib2.x86_64 0:2.56.1-9.el7_9
#   glibc.x86_64 0:2.17-326.el7_9                             glibc-common.x86_64 0:2.17-326.el7_9
#   gzip.x86_64 0:1.5-11.el7_9                                kpartx.x86_64 0:0.4.9-135.el7_9
#   krb5-libs.x86_64 0:1.15.1-51.el7_9                        libblkid.x86_64 0:2.23.2-65.el7_9.1
#   libcurl.x86_64 0:7.29.0-59.el7_9.1                        libmount.x86_64 0:2.23.2-65.el7_9.1
#   libsmartcols.x86_64 0:2.23.2-65.el7_9.1                   libuuid.x86_64 0:2.23.2-65.el7_9.1
#   libxml2.x86_64 0:2.9.1-6.el7_9.6                          libxml2-python.x86_64 0:2.9.1-6.el7_9.6
#   nspr.x86_64 0:4.32.0-1.el7_9                              nss.x86_64 0:3.67.0-4.el7_9
#   nss-softokn.x86_64 0:3.67.0-3.el7_9                       nss-softokn-freebl.x86_64 0:3.67.0-3.el7_9
#   nss-sysinit.x86_64 0:3.67.0-4.el7_9                       nss-tools.x86_64 0:3.67.0-4.el7_9
#   nss-util.x86_64 0:3.67.0-1.el7_9                          openldap.x86_64 0:2.4.44-25.el7_9
#   openssl-libs.x86_64 1:1.0.2k-25.el7_9                     python.x86_64 0:2.7.5-90.el7
#   python-libs.x86_64 0:2.7.5-90.el7                         rpm.x86_64 0:4.11.3-48.el7_9
#   rpm-build-libs.x86_64 0:4.11.3-48.el7_9                   rpm-libs.x86_64 0:4.11.3-48.el7_9
#   rpm-python.x86_64 0:4.11.3-48.el7_9                       systemd.x86_64 0:219-78.el7_9.5
#   systemd-libs.x86_64 0:219-78.el7_9.5                      tzdata.noarch 0:2022a-1.el7
#   util-linux.x86_64 0:2.23.2-65.el7_9.1                     vim-minimal.x86_64 2:7.4.629-8.el7_9
# TODO: Measure size delta. No obvious way except do a before/after. The update download is said to be 52 MB.


####################################################################################################
# Install basic tools for working in the shell.
####################################################################################################

# Packages we had to install on Ubuntu which are already on this CentOS image: 
# vim, ping, curl, strace


####################################################################################################
# git
# Install git as some pip and source-code-built installs may need it.
RUN yum -y install git
RUN git --version
# git version 1.8.3.1

# Installs packages:  git.x86_64 0:1.8.3.1-23.el7_8    and dependencies:
#   fipscheck.x86_64 0:1.4.1-6.el7                          fipscheck-lib.x86_64 0:1.4.1-6.el7
#   groff-base.x86_64 0:1.22.2-8.el7                        less.x86_64 0:458-9.el7
#   libedit.x86_64 0:3.0-12.20121213cvs.el7                 openssh.x86_64 0:7.4p1-22.el7_9
#   openssh-clients.x86_64 0:7.4p1-22.el7_9                 perl.x86_64 4:5.16.3-299.el7_9
#   perl-Carp.noarch 0:1.26-244.el7                         perl-Encode.x86_64 0:2.51-7.el7
#   perl-Error.noarch 1:0.17020-2.el7                       perl-Exporter.noarch 0:5.68-3.el7
#   perl-File-Path.noarch 0:2.09-2.el7                      perl-File-Temp.noarch 0:0.23.01-3.el7
#   perl-Filter.x86_64 0:1.49-3.el7                         perl-Getopt-Long.noarch 0:2.40-3.el7
#   perl-Git.noarch 0:1.8.3.1-23.el7_8                      perl-HTTP-Tiny.noarch 0:0.033-3.el7
#   perl-PathTools.x86_64 0:3.40-5.el7                      perl-Pod-Escapes.noarch 1:1.04-299.el7_9
#   perl-Pod-Perldoc.noarch 0:3.20-4.el7                    perl-Pod-Simple.noarch 1:3.28-4.el7
#   perl-Pod-Usage.noarch 0:1.63-3.el7                      perl-Scalar-List-Utils.x86_64 0:1.27-248.el7
#   perl-Socket.x86_64 0:2.010-5.el7                        perl-Storable.x86_64 0:2.45-3.el7
#   perl-TermReadKey.x86_64 0:2.30-20.el7                   perl-Text-ParseWords.noarch 0:3.29-4.el7
#   perl-Time-HiRes.x86_64 4:1.9725-3.el7                   perl-Time-Local.noarch 0:1.2300-2.el7
#   perl-constant.noarch 0:1.27-2.el7                       perl-libs.x86_64 4:5.16.3-299.el7_9
#   perl-macros.x86_64 4:5.16.3-299.el7_9                   perl-parent.noarch 1:0.225-244.el7
#   perl-podlators.noarch 0:2.5.1-3.el7                     perl-threads.x86_64 0:1.87-4.el7
#   perl-threads-shared.x86_64 0:1.43-6.el7                 rsync.x86_64 0:3.1.2-10.el7
# Adds: 68 MB   TODO: verify size
# NOTE: git is required to install Pyenv


####################################################################################################
# sysstat
# Install the sysstat package for monitoring, collection and analysis of system performance
# metrics and activity. The systat package includes many tools, but the most commonly used
# are iostat, mpstat, pidstat and sar.
RUN yum -y install sysstat
RUN iostat -V
# sysstat version 10.1.5

# ?????
# Installs packages:  cron libsensors-config libsensors5 sysstat ucf
# 0 upgraded, 5 newly installed, 0 to remove and 10 not upgraded.
# Adds: 2118 kB

# Installed packages:  sysstat.x86_64 0:10.1.5-19.el7    and dependencies:
#   cronie.x86_64 0:1.4.11-24.el7_9                    cronie-anacron.x86_64 0:1.4.11-24.el7_9
#   crontabs.noarch 0:1.11-6.20121102git.el7
#   lm_sensors-libs.x86_64 0:3.4.0-8.20160601gitf9185e5.el7 systemd-sysv.x86_64 0:219-78.el7_9.5


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

