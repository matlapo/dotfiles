#!/usr/bin/env zsh

# to install, first cd into env/ and run `brew bundle`
# then execute this file.

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function createLinks() {
	# editor
	mkdir -p ~/.config/nvim
	ln -sf ~/Projects/dotfiles/editor/init.vim ~/.config/nvim/init.vim
	gcp --symbolic-link -rf ~/Projects/dotfiles/editor/Sublime/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	gcp --symbolic-link -rf ~/Projects/dotfiles/editor/.* ~
	ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl subl

	# env
	ln -sf ~/Projects/dotfiles/env/.macos ~/.macos

	# gui
	mkdir -p ~/.hammerspoon
	gcp --symbolic-link -rf ~/Projects/dotfiles/gui/.hammerspoon/* ~/.hammerspoon
	ln -sf ~/Projects/dotfiles/gui/karabiner.json ~/.config/karabiner/karabiner.json

	# shell
	gcp --symbolic-link -rf ~/Projects/dotfiles/shell/.* ~
	gcp --symbolic-link -rf ~/Projects/dotfiles/shell/zsh/.* ~
	gcp --symbolic-link -rf ~/Projects/dotfiles/shell/git/.* ~
}

read -q '?This may overwrite existing files in your home directory. Are you sure? (y/n)? ';
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	createLinks;
fi;
unset createLinks;
