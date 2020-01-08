# Make key shortcuts closer to bash
bindkey -v
bindkey '^R' history-incremental-search-backward

# Theme
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
