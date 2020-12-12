#! /bin/bash

echo "---------------------------------------------------------"
echo "$(tput setaf 2) Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

INSTALLDIR=$pwd


echo "---------------------------------------------------------"
echo "$(tput setaf 2) Creating symbolic links.$(tput sgr 0)"
echo "---------------------------------------------------------"


ln -fs $PWD/tmux/.tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.vim
VIMFILES=( "$HOME/.vim:$DOTFILES/config/nvim"
	"$HOME/.vimrc:$DOTFILES/config/nvim/init.vim" )

for file in "${VIMFILES[@]}"; do
	KEY=${file%%:*}
	VALUE=${file#*:}
	if [ -e "${KEY}" ]; then
		info "${KEY} already exists... skipping."
	else
		info "Creating symlink for $KEY"
		ln -s "${VALUE}" "${KEY}"
	fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2) Installing nvm.$(tput sgr 0)"
echo "---------------------------------------------------------"

# https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash


