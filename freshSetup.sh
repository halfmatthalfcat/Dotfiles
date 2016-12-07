#!/bin/sh

# Set up external repos
dpkg --add-architecture i386
# Java
add-apt-repository ppa:webupd8team/java
# Atom
add-apt-repository ppa:webupd8team/atom
# Wine
add-apt-repository ppa:wine/wine-builds
# Flux
add-apt-repository ppa:nathan-renniewaldock/flux
# Android
add-apt-repository ppa:phablet-team/tools
# Dropbox
add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
apt-get install -y curl
# VLC
curl ftp://ftp.videolan.org/pub/debian/videolan-apt.asc | apt-get add -
# Chrome
curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-get add -
# Add sources
echo "deb ftp://ftp.videolan.org/pub/debian stable ./" | tee /etc/apt/sources.list.d/libdvdcss.list
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
apt-get update
# Installation
apt-get --allow-unauthenticated install sur5r-keyring google-chrome-stable
apt-get install -y python-software-properties oracle-java8-installer nodejs nodejs-legacy npm i3 vlc vlc-data browser-plugin-vlc mplayer2 ubuntu-restricted-extras libdvdcss2 libdvdnav4 libdvdread4 git steam atom sbt wget zsh fluxgui android-tools-adb android-tools-fastboot dropbox conky
apt-get install -y --install-recommends winehq-devel
# Scala
wget -P /tmp/ http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.deb
dpkg -i /tmp/scala-2.11.8
# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Node stuff
npm install -g grunt gulp webpack n
n stable
# Moving files around
