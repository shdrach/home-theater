# Home Theater Setup

## Overview

This setup includes:
1. Radarr as download manager for movies
2. Sonarr as download manager for tv shows
3. Sabnzbs as nzb client (usenet client), radarr and sonarr use it to perform the actual download (you can replace it with qbitorrent or transmission if you want to use p2p torrents instead of usenet).
4. Optional: Nginx as reverse proxy
5. Optional: Emby as media server
6. Optional: Sharing over NFS (assumed preinstalled as part of distro)
7. Optional: Setup a logical volume under the download folder

## Before you install

It's possible to set up a logical volume, so that you'll be able to add more storage space to your `downloads` directory. There are a few commands that been commented out in the `setup.sh` script, feel free to modify them to suit your needs.  

## Installation

1. Copy all files to the target machine 
2. Run `sudo ./setup.sh` (installs docker, docker compose, sets up all the directories) 
3. `cd ~/ht-setup`
4. Run `docker-compose up -d` to start all servers

## Optional additions
### Setup NFS share

1. Copy the provided exports file to `/etc/exports` (if it already exists, you can just append to the original)
2. Modify exports file - replace `<your cidr>` with your networks CIDR (for example: `192.168.1.0/24`)

> Note: The exports file configures the share as read only

### Setup reverse proxy 

> Note: This is an optional **post** installation stage

In order to get nginx to work, you'll need to modify its config file under `~/ht-setup/configs/nginx.conf`, just replace every `<replace with host address>` with the hosts ip address.

## Setting up Radarr and Sonarr

Once everything is up, Radarr and Sonarr should be available at: `http://<host-ip>:7878` (for radarr) and `http://<host-ip>:8989` (for sonarr)

> You'll need to setup your chosen download client (usenet / torrent) in each program's UI, but that's pretty straightforward.