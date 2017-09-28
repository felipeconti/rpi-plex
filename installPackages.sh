#!/bin/bash

set -e

apt-get update
apt-get install -y --force-yes wget apt-transport-https

wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | apt-key add -
echo "deb [arch=armhf] https://dev2day.de/pms/ jessie main" >> /etc/apt/sources.list.d/pms.list 
apt-get update -y 
apt-get upgrade -y
apt-get install locales wget ca-certificates apt-transport-https mkvtoolnix libexpat1 libc6 -y

sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen

apt-get install plexmediaserver-installer:armhf -y
