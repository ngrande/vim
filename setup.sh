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
	# to switch between header and source file
	vim-a \
	# nice status bar
	vim-airline \
	# nice themes for status bar
	vim-airline-themes \
	# fuzzy file search
	vim-ctrlp \
	# for git integration
	vim-fugitive \
	# can get annoying really quick...
	#vim-jedi \
	# spell checking
	vim-spell-de \
	vim-spell-en \
	# obsolete by youcompleteme
	#vim-supertab \
	#vim-syntastic \
	# file tree
	vim-nerdtree \
	# toggle comments
	vim-nerdcommenter \
	# status bar addition for airline
	powerline \
	powerline-vim \
	powerline-fonts \
	# opts for powerline
	python-pygit2 \
	python-psutil \

echo "${bold}Removing vimp plugins that interfere with the above installed ones${normal}"
sudo pacman -Rs vim-supertab vim-jedi vim-syntastic

echo "installation finished"

echo "${bold} Installing vim plugins + themes from AUR (via yaourt) - press [y|Y] to continue or anything else to skip${normal}"
read -n 1 key
echo ""
if [ "${key,,}" = "y" ]; then
	pacaur -S --needed vim-youcompleteme-git vim-colorschemes
	
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
