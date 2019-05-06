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
	vim-spell-de \
	vim-spell-en \
	vim-nerdtree \
	vim-nerdcommenter \
	powerline \
	powerline-vim \
	powerline-fonts \
	python-pygit2 \
	python-psutil \
	fzf \

echo "${bold}Removing vimp plugins that interfere with the above installed ones${normal}"
sudo pacman -Rs vim-supertab vim-jedi vim-syntastic vim-tagbar vim-taglist

echo "installation finished"

echo "${bold} Installing vim plugins + themes from AUR (via aurman) - press [y|Y] to continue or anything else to skip${normal}"
read -n 1 key
echo ""
if [ "${key,,}" = "y" ]; then
	yay -S --needed \
		vim-youcompleteme-git \
		vim-colorschemes \
		vim-fzf-git \

	# create symlink for .ycm_extra_conf.py
	mkdir ~/.vim/
	ln -sf $(pwd)/dot/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

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
