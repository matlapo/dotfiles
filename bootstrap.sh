#!/usr/bin/env zsh

# to install, first cd into env/ and run `brew bundle`
# then execute this file.

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function createLinks() {
	# editor
	mkdir -p ~/.config/nvim
	ln -sf ~/code/dotfiles/editor/init.vim ~/.config/nvim/init.vim
	gcp --symbolic-link -rf ~/code/dotfiles/editor/.* ~
	ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl

	# gui
	mkdir -p ~/.hammerspoon
	gcp --symbolic-link -rf ~/code/dotfiles/gui/.hammerspoon/* ~/.hammerspoon

	# shell
	gcp --symbolic-link -rf ~/code/dotfiles/shell/zsh/.* ~
	gcp --symbolic-link -rf ~/code/dotfiles/shell/git/.* ~
}

read -q '?This may overwrite existing files in your home directory. Are you sure? (y/n)? ';
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	createLinks;
fi;
unset createLinks;
