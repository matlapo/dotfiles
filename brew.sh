#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
# Removed for now until brew install moreutils --without-parallel works
# moreutils's parallel clashes with GNU parallel
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh

# Install other useful binaries.
brew install ack
brew install git
brew install lua
brew install tig
brew install fish
brew install nvim
brew install autojump
brew install zsh-syntax-highlighting
brew install bat
brew install exa
brew install ripgrep
brew install fd
brew install jq
brew install ngrep
brew install thefuck
brew install tmux
brew install htop
brew install youtube-dl
brew install httpie
brew install parallel

# Install some other software with cask
brew cask install hammerspoon
brew cask install alfred
brew cask install dash
brew cask install sublime-text

# Remove outdated versions from the cellar.
brew cleanup
