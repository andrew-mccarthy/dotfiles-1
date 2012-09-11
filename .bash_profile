#MACOS VERSION

# Set git autocompletion and PS1 integration
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.bash
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gpp='git pull --rebase && git push'
alias gmf='git merge --ff-only'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias pryr='pry -r ./config/environment -r rails/console/app -r rails/console/helpers'

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

function __jobs {
  if [ ! $1 -eq 0 ]; then
    echo "* "
  fi
}

PS1='\[\033[31m\]$(__jobs \j)\[\033[00m\]\u@\h:\w\[\033[32m\]$(__git_ps1)\[\033[00m\]\$ '

export EDITOR='vim'

## GIT
# Abbreviations
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch

# From: http://www.jukie.net/bart/blog/pimping-out-git-log
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

export NODE_PATH="/usr/local/lib/node_modules"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
set -o vi
