alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias c="cd"
alias ..=".."
alias v="nvim"
alias c="cargo"

# git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

set -Ux EDITOR nvim

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Start fish in tmux session
test $TERM != "screen"; and exec tmux
set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
