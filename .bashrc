# lsコマンドに色を付ける
alias ls='ls -AG'
alias ll='ls -lG'

# Gitコマンド Alias
alias graph='git log --graph --decorate --oneline'
alias graphd='git log --graph --decorate'

alias cpanml="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print | less"

source ~/git-completion.bash
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(*\1)/'
}
function precmd() {
  PROMPT="\[\e[0;36m\][\u\$(parse_git_branch): \W]\$\[\e[00m\] "
}
function proml {
  # PS1の出力形式を変更
  # gitリポジトリ内ではbranchを表示
  PS1="\[\e[0;36m\][\u\[\e[0;31m\]\$(parse_git_branch)\[\e[0;36m\]: \W]\$\[\e[00m\] "
}
proml

export PATH="$PATH:$HOME/sh"

