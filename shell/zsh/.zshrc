for file in ~/.{zsh_prompt,exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# save history to a file
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

alias ev="$EDITOR $HOME/.zshrc"
alias sv="source $HOME/.zshrc"
