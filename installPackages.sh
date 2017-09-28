#!/bin/bash

set -e

apt-get update
apt-get install -y --force-yes wget 

#sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
#locale-gen

# add my public key
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | apt-key add -
# add my PMS repo
echo "deb [arch=armhf] https://dev2day.de/pms/ jessie main" >> /etc/apt/sources.list.d/pms.list
# activate https
apt-get install apt-transport-https
# enable armhf support
dpkg --add-architecture armhf 
# update the repos
apt-get update
# install PMS
apt-get install plexmediaserver-installer:armhf 
