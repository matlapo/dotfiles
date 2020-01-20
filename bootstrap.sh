#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "brew.sh" \
		-avh --no-perms . ~;
	source ~/.zshrc; # TODO: this doesnt seem to work properly
	# execute macos? init option
	# reset env option too
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
	doIt;
else
	read -q '?This may overwrite existing files in your home directory. Are you sure? (y/n)? ';
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
