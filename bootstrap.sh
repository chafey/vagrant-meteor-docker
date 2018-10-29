#! /bin/bash

export METEOR_VERSION='1.4.2.7'

# turn off apt errors "dpkg-preconfigure: unable to re-open stdin: No such file or directory"
export DEBIAN_FRONTEND=noninteractive

#update apt
apt-get update

#make sure we have up to date versions of git and curl 
apt-get install git
apt-get install curl

# install latest meteor

su -c "curl https://install.meteor.com/?release=$METEOR_VERSION | sh" vagrant

### BEGIN INSTALL NVM/NODE

# install c++ compiler
apt-get install build-essential libss1-dev

su -c "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash" vagrant

### END INSTALL NVM/NODE

# install rsync
apt-get install -y rsync

