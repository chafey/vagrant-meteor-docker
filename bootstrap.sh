#! /bin/bash

export METEOR_VERSION='1.4.2.7'

# turn off apt errors "dpkg-preconfigure: unable to re-open stdin: No such file or directory"
export DEBIAN_FRONTEND=noninteractive

#update apt
apt-get update

#make sure we have up to date versions of git and curl 
apt-get install -y git
apt-get install -y curl

# install build-essential tools for g++ (needed for building native code in node/meteor)
apt-get install -y build-essential

# increase limits on resources we need for development (https://medium.com/@muhammadtriwibowo/set-permanently-ulimit-n-open-files-in-ubuntu-4d61064429a)
echo "
* soft     nproc          65535
* hard     nproc          65535
* soft     nofile         65535
* hard     nofile         65535
root soft     nproc          65535   
root hard     nproc          65535 
root soft     nofile         65535 
root hard     nofile         65535" | tee -a /etc/security/limits.conf

echo session required pam_limits.so | tee -a /etc/pam.d/common-session

echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf

echo fs.file-max = 65535 | tee -a /etc/sysctl.conf

sysctl -p

# install latest meteor
su -c "curl https://install.meteor.com/?release=$METEOR_VERSION | sh" vagrant

#install NVM
su -c "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash" vagrant

# install rsync
apt-get install -y rsync

### begin install docker-ce (https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1)
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y docker-ce
### end install docker-ce

# add vagrant user to docker group so it can access docker daemon 
usermod -a -G docker vagrant
