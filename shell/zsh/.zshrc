# Theme (need to have it installed using Homebrew first)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

for file in ~/.{zsh_prompt,exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# fzf configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# save history to a file
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

autoload -U vf

