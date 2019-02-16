#!/bin/bash
set -x

TERRAFORM_VERSION="0.11.11"
PACKER_VERSION="0.10.2"
# create new ssh key
[[ ! -f /home/ubuntu/.ssh/mykey ]] \
&& mkdir -p /home/ubuntu/.ssh \
&& ssh-keygen -f /home/ubuntu/.ssh/mykey -N '' \
&& chown -R ubuntu:ubuntu /home/ubuntu/.ssh

# install packages
sudo apt-get update
sudo apt-get -y install docker.io ansible unzip

# add docker privileges
usermod -G docker ubuntu

# install pip
sudo pip install -U pip && pip3 install -U pip
if [[ $? == 127 ]]; then
    wget -q https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    python3 get-pip.py
fi
# install awscli and ebcli
sudo pip install -U awscli
sudo pip install -U awsebcli

# Install necessary dependencies
sudo apt-get -y -q install curl wget git tmux vim
sudo apt-get install zsh

#terraform
T_VERSION=$(terraform -v | head -1 | cut -d ' ' -f 2 | tail -c +2)
T_RETVAL=${PIPESTATUS[0]}

[[ $T_VERSION != $TERRAFORM_VERSION ]] || [[ $T_RETVAL != 0 ]] \
&& wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# packer
P_VERSION=$(packer -v)
P_RETVAL=$?

[[ $P_VERSION != $PACKER_VERSION ]] || [[ $P_RETVAL != 1 ]] \
&& wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
&& unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm packer_${PACKER_VERSION}_linux_amd64.zip

#kuctl
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install software-properties-common
sudo apt-get install -y kubectl

# Upgrade the Distro from xenial16.4 to bionic 18.04 
sudo apt-get -y update && sudo apt-get -y dist-upgrade

# Install net-tools
sudo apt-get install net-tools
sudo apt-get install nmap

# Install Scanning & Monitoring Tools
sudo apt-get install lynis -y

# Color
sudo apt-get install ccze
sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt-get update
sudo apt-get install neofetch
sudo apt-get install sysvbanner
sudo apt-get install linuxlogo
sudo apt-get install python3-pip -y
sudo python -m pip install boto3
sudo pip install --upgrade pip

# Install Ansible repository.
sudo apt-get -y install software-properties-common
sudo apt-get install update-manager-core
do-release-upgrade -d

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Using APT you can install the tools with the following RPM packages
sudo apt-get install procps*
sudo apt-get install psmisc*
sudo apt-get install vnstat*
sudo apt-get install ncdu*
sudo apt-get install ipcalc*
sudo apt-get install ack*
sudo apt-get install lsof*
sudo apt-get install iotop -y
sudo apt-get install htop*
sudo apt-get install sysstat -y

# Install CLI tools
sudo apt-get install ack*
sudo apt-get install acpid*
sudo apt-get install bind*
sudo apt-get install binutils*
sudo apt-get install pdsh*
sudo apt-get install psmisc*
sudo apt-get install file*
sudo apt-get install gitFull*
sudo apt-get install htop*
sudo apt-get install powertop*
sudo apt-get install silver-searcher*
sudo apt-get install screen*
sudo apt-get install w3m*
sudo apt-get install links*
sudo apt-get install mutt*
sudo apt-get install weechat*
sudo apt-get install openconnect*
sudo apt-get install xfontsel*
sudo apt-get install gitAndTools.hub*
sudo apt-get install gist*
sudo apt-get install xclip*
sudo apt-get install xsel*
sudo apt-get install fortune*
sudo apt-get install tig*
sudo apt-get install weechat*
sudo apt-get install scrot*
sudo apt-get install xbindkeys*
sudo apt-get install pamixer*
sudo apt-get install xscreensaver*
sudo apt-get install tk*
sudo apt-get install zip*
sudo apt-get install unzip*
sudo apt-get install sysdig*
sudo apt-get install tcpdump*
sudo apt-get install vcprompt*
sudo apt-get install cowsay*
sudo apt-get install figlet*
sudo apt-get install rlwrap*
sudo apt-get install tree*
sudo apt-get install nixbang*
sudo apt-get install mkpasswd*
sudo apt-get install jwhois*
sudo apt-get install jq*
sudo apt-get install xmonad-with-packages*
sudo apt-get install libressl*
sudo apt-get install gnupg*
sudo apt-get install gnupg1compat*
sudo apt-get install zfs*
sudo apt-get install zfstools*
sudo apt-get install xlibs.xmodmap*
sudo apt-get install zlib*

# Install Development Tools
sudo apt-get install vim*
sudo apt-get install gcc48*
sudo apt-get install ncurses*
sudo apt-get install gnumake*
sudo apt-get install pypyPackages.pip*
pypyPackages.virtualenvwrapper*
sudo apt-get install ruby*
sudo apt-get install bundix*
sudo apt-get install erlang*
sudo apt-get install openjdk*
sudo apt-get install scala*
sudo apt-get install sbt*
sudo apt-get install nixops*
sudo apt-get install disnix
sudo apt-get install consul
sudo apt-get install nodejs

# clean up
sudo apt-get clean
