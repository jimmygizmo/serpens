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

# Installed packages:  sysstat.x86_64 0:10.1.5-19.el7    and dependencies:
#   cronie.x86_64 0:1.4.11-24.el7_9                    cronie-anacron.x86_64 0:1.4.11-24.el7_9
#   crontabs.noarch 0:1.11-6.20121102git.el7
#   lm_sensors-libs.x86_64 0:3.4.0-8.20160601gitf9185e5.el7 systemd-sysv.x86_64 0:219-78.el7_9.5
# Adds: 1.4 MB


####################################################################################################
# ab - Apache Bench - (httpd-tools package)
# ab is a good load/capactity-testing tool for generating rapid HTTP requests to web servers or
# REST services and can be used for both dev and troubleshooting or testing when deployed. Since we
# use Nginx, the other tools in this package are not of interest. We only need ab. Install is small.
RUN yum -y install httpd-tools
RUN ab -V
# This is ApacheBench, Version 2.3

# Installed packages:  httpd-tools.x86_64 0:2.4.6-97.el7.centos.5
# Adds: 200k


####################################################################################################


####################################################################################################
# Install libraries and SDKs for building
####################################################################################################


####################################################################################################
# Development Tools
RUN yum -y groupinstall "Development Tools"

# TODO: All over this file I use the word 'Installed' here but I use 'Installs' in the
# Ubuntu version. I think 'Installs' is best. Change all to that.
# Installed:  autoconf.noarch 0:2.69-11.el7
#   automake.noarch 0:1.13.4-3.el7
#   bison.x86_64 0:3.0.4-2.el7
#   byacc.x86_64 0:1.9.20130304-3.el7
#   cscope.x86_64 0:15.8-10.el7
#   ctags.x86_64 0:5.8-13.el7
#   diffstat.x86_64 0:1.57-4.el7
#   doxygen.x86_64 1:1.8.5-4.el7
#   elfutils.x86_64 0:0.176-5.el7
#   flex.x86_64 0:2.5.37-6.el7
#   gcc.x86_64 0:4.8.5-44.el7
#   gcc-c++.x86_64 0:4.8.5-44.el7
#   gcc-gfortran.x86_64 0:4.8.5-44.el7
#   gettext.x86_64 0:0.19.8.1-3.el7
#   indent.x86_64 0:2.2.11-13.el7
#   intltool.noarch 0:0.50.2-7.el7
#   libtool.x86_64 0:2.4.2-22.el7_3
#   make.x86_64 1:3.82-24.el7
#   patch.x86_64 0:2.7.1-12.el7_7
#   patchutils.x86_64 0:0.3.3-5.el7_9
#   rcs.x86_64 0:5.9.0-7.el7
#   redhat-rpm-config.noarch 0:9.1.0-88.el7.centos
#   rpm-build.x86_64 0:4.11.3-48.el7_9
#   rpm-sign.x86_64 0:4.11.3-48.el7_9
#   subversion.x86_64 0:1.7.14-16.el7
#   swig.x86_64 0:2.0.10-5.el7
#   systemtap.x86_64 0:4.0-13.el7
# Dependencies Installed:
#   apr.x86_64 0:1.4.8-7.el7
#   apr-util.x86_64 0:1.5.2-6.el7
#   avahi-libs.x86_64 0:0.6.31-20.el7
#   boost-date-time.x86_64 0:1.53.0-28.el7
#   boost-system.x86_64 0:1.53.0-28.el7
#   boost-thread.x86_64 0:1.53.0-28.el7
#   bzip2.x86_64 0:1.0.6-13.el7
#   cpp.x86_64 0:4.8.5-44.el7
#   dwz.x86_64 0:0.11-3.el7
#   dyninst.x86_64 0:9.3.1-3.el7
#   efivar-libs.x86_64 0:36-12.el7
#   emacs-filesystem.noarch 1:24.3-23.el7
#   file.x86_64 0:5.11-37.el7
#   gdb.x86_64 0:7.6.1-120.el7
#   gettext-common-devel.noarch 0:0.19.8.1-3.el7
#   gettext-devel.x86_64 0:0.19.8.1-3.el7
#   gettext-libs.x86_64 0:0.19.8.1-3.el7
#   glibc-devel.x86_64 0:2.17-326.el7_9
#   glibc-headers.x86_64 0:2.17-326.el7_9
#   gnutls.x86_64 0:3.3.29-9.el7_6
#   kernel-debug-devel.x86_64 0:3.10.0-1160.66.1.el7
#   kernel-headers.x86_64 0:3.10.0-1160.66.1.el7
#   libcroco.x86_64 0:0.6.12-6.el7_9
#   libdwarf.x86_64 0:20130207-4.el7
#   libgfortran.x86_64 0:4.8.5-44.el7
#   libgomp.x86_64 0:4.8.5-44.el7
#   libmodman.x86_64 0:2.0.1-8.el7
#   libmpc.x86_64 0:1.0.1-3.el7
#   libproxy.x86_64 0:0.4.11-11.el7
#   libquadmath.x86_64 0:4.8.5-44.el7
#   libquadmath-devel.x86_64 0:4.8.5-44.el7
#   libstdc++-devel.x86_64 0:4.8.5-44.el7
#   libunistring.x86_64 0:0.9.3-9.el7
#   m4.x86_64 0:1.4.16-10.el7
#   mokutil.x86_64 0:15-8.el7
#   mpfr.x86_64 0:3.1.1-4.el7
#   neon.x86_64 0:0.30.0-4.el7
#   nettle.x86_64 0:2.7.1-9.el7_9
#   pakchois.x86_64 0:0.4-10.el7
#   perl-Data-Dumper.x86_64 0:2.145-3.el7
#   perl-Test-Harness.noarch 0:3.28-3.el7
#   perl-Thread-Queue.noarch 0:3.02-2.el7
#   perl-XML-Parser.x86_64 0:2.41-10.el7
#   perl-srpm-macros.noarch 0:1-8.el7
#   python-srpm-macros.noarch 0:3-34.el7
#   subversion-libs.x86_64 0:1.7.14-16.el7
#   systemtap-client.x86_64 0:4.0-13.el7
#   systemtap-devel.x86_64 0:4.0-13.el7
#   systemtap-runtime.x86_64 0:4.0-13.el7
#   trousers.x86_64 0:0.3.14-2.el7
#   unzip.x86_64 0:6.0-24.el7_9
#   zip.x86_64 0:3.0-11.el7
# Adds: 239 MB


####################################################################################################
# psql
# Only the client is desired here, but the small install includes the server anyhow.

# RUN yum -y install postgresql-libs.x86_64
RUN yum -y install postgresql.x86_64
RUN psql --version

# Installed:  postgresql.x86_64 0:9.2.24-7.el7_9   and dependency:
#   postgresql-libs.x86_64 0:9.2.24-7.el7_9
# Adds: 17 MB


####################################################################################################
# pyenv
# This is a source install involving many steps, beginning with cloning the repository.
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# THIS PART OF THE INSTALLATION AND SETUP WILL NEED SOME WORK.
# The situation is the same on Ubuntu. We will most likely need to use an application user instead
# of root, which is best practice anyhow, even in containers. The problem with root is we cannot
# get the changes to the environemnt to pick up and this activate Pyenv in any way documented or
# that we have tried: source, ., su -, exec .. and not with .bashrc or .profile or other methods.
# See notes in Ubuntu info directory and in the comments in the Ubuntu Serpens Dockerfile.








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

