#!/bin/bash
set -e
set -o pipefail

sudo -v
echo "Starting Install!" 
sudo apt -y install git
echo "Installed Git!" 
sudo apt -y install xpad
echo "Installed xpad!" 
sudo apt -y install python3-pip
echo "Installing python3-pip"
sudo apt -y install python3-virtualenv
echo "Installed virtualenv!" 

mkdir ~/work/

sudo apt -y install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.
echo "Installed Vim!" 

# ----------UPDATE CUDA VERSION BEFORE RUNNING------------------------
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get -y update
sudo apt-get -y install cuda-11-7
# --------------------------------------------------------------------
echo "Installed CUDA!" 

sudo add-apt-repository ppa:flexiondotorg/nvtop
sudo apt -y install nvtop
echo "Installed NVTOP!" 
