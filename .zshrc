# Theme (need to have it installed using Homebrew first)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
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

export FPATH="$HOME/.zsh/autoload/:$FPATH"
autoload -U vf

export PATH=/usr/local/Cellar/ruby/2.6.5/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.6.0/bin:$PATH
export PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin
