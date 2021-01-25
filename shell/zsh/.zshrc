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
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

setopt globdots

autoload -U vf
autoload -U co

alias ev="$EDITOR $HOME/.zshrc"
alias sv="source $HOME/.zshrc"

# active OTP 21
KERL_ENABLE_PROMPT=y . ~/kerl/23.0/activate

# pyenv set up
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

