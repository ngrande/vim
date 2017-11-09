#!/bin/bash

# bash script to setup vim on my arch installations

bold=$(tput bold)
normal=$(tput sgr0)
hl=$(tput smso)

function print_fin() {
	echo "${bold}installation done${normal}"
}

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
	# can get annoying really quick...
	#vim-jedi \
	vim-spell-de \
	vim-spell-en \
	# obsolete by youcompleteme
	#vim-supertab \
	vim-syntastic \
	vim-nerdtree \
	vim-nerdcommenter \
	powerline \
	powerline-vim \
	powerline-fonts \
	python-pygit2 \
	python-psutil \

echo "${bold}Removing vimp plugins that interfere with the above installed ones${normal}"
sudo pacman -Rs vim-supertab vim-jedi

echo "installation finished"

echo "${bold} Installing vim plugins + themes from AUR (via yaourt) - press [y|Y] to continue or anything else to skip${normal}"
read -n 1 key
echo ""
if [ "${key,,}" = "y" ]; then
	yaourt -S --aur --needed vim-youcompleteme-git vim-tomorrow-theme-git
	print_fin
fi

echo "${bold} Should i install some nice TrueType monospaced fonts? - press [y|Y]${bold}"
read -n 1 key
echo ""
if [ "${key,,}" = "y" ]; then
	sudo pacman -S --needed ttf-droid adobe-source-code-pro-fonts ttf-hack
	print_fin
fi

# setup symlinks
echo "${bold}Setting up symlink for current user - press [y|Y] to continue${normal}"
read -n 1 key
echo ""
if [ "${key,,}" = "y" ]; then
	ln -sf $(pwd)/vimrc ~/.vimrc
	echo "${bold}symlink for current user created${normal}"
fi

echo ""
echo "###################"
echo "#                 #"
echo "#       DONE      #"
echo "#                 #"
echo "###################"
echo ""

#echo "${bold}Setting up symlink for root - press <ENTER> to continue${normal}"
#read
#sudo ln -sf $(pwd)/vimrc /etc/vimrc
#echo "symlink for root created"
