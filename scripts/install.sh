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
sudo apt-get -y update
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
sudo apt-get -y install zsh

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
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-get -y install -y kubectl

# Upgrade the Distro from xenial16.4 to bionic 18.04 
sudo apt-get -y update && sudo apt-get -y dist-upgrade

# Install net-tools
sudo apt-get -y install net-tools
sudo apt-get -y install nmap

# Install Scanning & Monitoring Tools
sudo apt-get install lynis -y

# Color
sudo apt-get -y install ccze
sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt-get update
sudo apt-get -y install neofetch
sudo apt-get -y install sysvbanner
sudo apt-get -y install linuxlogo

# Install Python3 and Boto
sudo apt-get -y install python3-pip -y
sudo python -m pip install boto3
sudo pip install --upgrade pip

# Install Ansible repository.
sudo apt-get -y install software-properties-common
sudo apt-get -y install update-manager-core
do-release-upgrade -d

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Using APT you can install the tools with the following RPM packages
sudo apt-get -y install procps*
sudo apt-get -y install psmisc*
sudo apt-get -y install vnstat*
sudo apt-get -y install ncdu*
sudo apt-get -y install ipcalc*
sudo apt-get -y install ack*
sudo apt-get -y install lsof*
sudo apt-get -y install iotop -y
sudo apt-get -y install htop*
sudo apt-get -y install sysstat -y

# Install CLI tools
sudo apt-get -y install ack*
sudo apt-get -y install acpid*
sudo apt-get -y install bind*
sudo apt-get -y install binutils*
sudo apt-get -y install pdsh*
sudo apt-get -y install psmisc*
sudo apt-get -y install file*
sudo apt-get -y install gitFull*
sudo apt-get -y install htop*
sudo apt-get -y install powertop*
sudo apt-get -y install silver-searcher*
sudo apt-get -y install screen*
sudo apt-get -y install w3m*
sudo apt-get -y install links*
sudo apt-get -y install mutt*
sudo apt-get -y install weechat*
sudo apt-get -y install openconnect*
sudo apt-get -y install xfontsel*
sudo apt-get -y install gitAndTools.hub*
sudo apt-get -y install gist*
sudo apt-get -y install xclip*
sudo apt-get -y install xsel*
sudo apt-get -y install fortune*
sudo apt-get -y install tig*
sudo apt-get -y install weechat*
sudo apt-get -y install scrot*
sudo apt-get -y install xbindkeys*
sudo apt-get -y install pamixer*
sudo apt-get -y install xscreensaver*
sudo apt-get -y install tk*
sudo apt-get -y install zip*
sudo apt-get -y install unzip*
sudo apt-get -y install sysdig*
sudo apt-get -y install tcpdump*
sudo apt-get -y install vcprompt*
sudo apt-get -y install cowsay*
sudo apt-get -y install figlet*
sudo apt-get -y install rlwrap*
sudo apt-get -y install tree*
sudo apt-get -y install nixbang*
sudo apt-get -y install mkpasswd*
sudo apt-get -y install jwhois*
sudo apt-get -y install jq*
sudo apt-get -y install xmonad-with-packages*
sudo apt-get -y install libressl*
sudo apt-get -y install gnupg*
sudo apt-get -y install gnupg1compat*
sudo apt-get -y install zfs*
sudo apt-get -y install zfstools*
sudo apt-get -y install xlibs.xmodmap*
sudo apt-get -y install zlib*

# Install Development Tools
sudo apt-get -y install vim*
sudo apt-get -y install gcc48*
sudo apt-get -y install ncurses*
sudo apt-get -y install gnumake*
sudo apt-get -y install pypyPackages.pip*
pypyPackages.virtualenvwrapper*
sudo apt-get -y install ruby*
sudo apt-get -y install bundix*
sudo apt-get -y install erlang*
sudo apt-get -y install openjdk*
sudo apt-get -y install scala*
sudo apt-get -y install sbt*
sudo apt-get -y install nixops*
sudo apt-get -y install disnix
sudo apt-get -y install consul
sudo apt-get -y install nodejs

# Java Installation
sudo apt-get -y install default-jdk
sudo apt-get -y install default-jre
sudo apt-get -y install openjdk-11-jdk
sudo apt-get -y install openjdk-8-jdk
sudo apt-get -y install openjdk-9-jdk

# Installing the Oracle JDK
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y install oracle-java8-installer
sudo update-alternatives --config java
sudo update-alternatives --config javac

# Download Python 2.7
sudo apt-get -y update
sudo apt-get -y install build-essential checkinstall
sudo apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
cd /usr/src
sudo wget https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz
sudo tar xzf Python-2.7.15.tgz
cd Python-2.7.15
sudo ./configure --enable-optimizations
sudo make altinstall

# Install Python 3.7.2
sudo apt-get -y install build-essential checkinstall
sudo apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev \libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
sudo tar xzf Python-3.7.2.tgz
cd Python-3.7.2
sudo ./configure --enable-optimizations
sudo make altinstall

# Install virtualenv and virtualenvwrapper 
sudo apt-get -y update
$ sudo apt-get -y install python-pip
sudo apt-get -y install python-pip python-dev build-essential
sudo pip -y install virtualenv virtualenvwrapper
sudo pip -y install --upgrade pip

# Create a backup of your .bashrc file
cp ~/.bashrc ~/.bashrc-org

# Be careful with this command
printf '\n%s\n%s\n%s' '# virtualenv' 'export WORKON_HOME=~/virtualenvs' \'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc

# Enable the virtual environment
source ~/.bashrc
mkdir -p $WORKON_HOME
mkvirtualenv api

# Exit the 'api' virtual environment
deactivate

# clean up
sudo apt-get clean
