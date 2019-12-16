#!/bin/bash


# create volumes (if you want):
# sudo pvcreate # /dev/sdb1 /dev/sdc1 etc...
# sudo vgcreate downloadVG # /dev/sdb1 /dev/sdc1 etc...
# sudo lvcreate -n downloadLV -L <size (1.5T, 500G...)> downloadVG
# sudo mkfs.ext3 /dev/downloadVG/downloadLV
# sudo mount /dev/downloadVG/downloadLV /downloads/

# create media directories
sudo mkdir /downloads
sudo mkdir /downloads/downloads
sudo mkdir /downloads/incomplete-downloads
sudo mkdir /downloads/movies
sudo mkdir /downloads/tv
sudo chmod -R 777 /downloads

# create installation directory
sudo mkdir ~/ht-setup

# radarr directories
sudo mkdir ~/radarr
sudo mkdir ~/radarr/config

# sonarr directories
sudo mkdir ~/sonarr
sudo mkdir ~/sonarr/config

# sabnzbd directories
sudo mkdir ~/sabnzbd
sudo mkdir ~/sabnzbd/config

# install docker
sudo apt-get install -y docker

# install docker-compose (a bit of an old version, we're at 1.25 now)
sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install scripts
sudo cp ./docker-compose.yml ~/ht-setup/docker-compose.yml
