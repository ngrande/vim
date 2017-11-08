#!/bin/bash

# bash script to setup vim on my arch installations

bold=$(tput bold)
normal=$(tput sgr0)
hl=$(tput smso)

# install vim and plugins from arch repo
echo "${bold}Installing vim and plugins${normal}"
sudo pacman -S --needed \
	vim \
	vim-runtime \
	vim-a \
	vim-airline \
	vim-airline-themes \
	vim-ctrlp \
	vim-fugitive \
#	vim-jedi \
	vim-spell-de \
	vim-spell-en \
	vim-supertab \
#	vim-syntastic \
	vim-nerdtree \
	vim-nerdcommenter \
	powerline \
	powerline-vim \
	powerline-fonts \
	python-pygit2 \
	python-psutil \

echo "${bold} Installing vim plugins + themes from AUR (via yaourt) - press [y|Y] to continue or anything else to skip${normal}"
read -n 1 key
echo ""
if [ ${key,,} = "y" ]; then
	yaourt -S --aur --needed vim-youcompleteme-git vim-tomorrow-theme-git
fi

# setup symlinks
echo "${bold}Setting up symlink for current user - press <ENTER> to continue${normal}"
read
ln -sf $(pwd)/vimrc ~/.vimrc

#echo "${bold}Setting up symlink for root - press <ENTER> to continue${normal}"
#read
#sudo ln -sf $(pwd)/vimrc /etc/vimrc

