# Make key shortcuts closer to bash
bindkey -v
bindkey '^R' history-incremental-search-backward

# Theme (need to have it installed using Homebrew first)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{zsh_prompt,exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
