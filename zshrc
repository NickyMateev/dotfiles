export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  autojump
  git
  docker
  vi-mode
  copyfile
  web-search
)

# Ignore these permission issues and load the completion system normally:
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration:

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/mvn/apache-maven-3.5.0/bin:$PATH
export PATH=$HOME/scripts:$GITPATH/NickyMateev/dotfiles/scripts:$PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.ghcup/env:$PATH"
export PATH="$HOME/.config/wtf/scripts:$PATH"

export GITPATH="$HOME/Documents/GitHub"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home
export GOPATH="$HOME/go"

# Aliases:

alias vimrc="vim ~/.vimrc"

# Edit zsh config, add to the dotfiles repo the newest config version and finally run it:
zshconfig() {
  vim ~/.zshrc
  cp ~/.zshrc $GITPATH/NickyMateev/dotfiles/zshrc
  . ~/.zshrc
}

alias :q="exit"

alias todo="open https://todoist.com/"
alias tog="open https://toggl.com/app/timer"
alias poc="open https://getpocket.com/"
alias mfp="open https://www.myfitnesspal.com/"

# Git aliases:
alias gc="git clone"
alias gs="git status"
alias gsh="git stash"
alias gsa="git stash apply"
alias ga="git add"
alias gm="git commit"
alias gam="git commit -a -m"
alias up="git push"
alias upp="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias down="git pull"
alias gf="git diff"
alias gl="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias gira="git reset HEAD --hard"

# Checkout to git branch, create one if it doesn't exist:
goto() {
  git checkout $1
  if [ $? -ne 0 ]; then 
    git checkout -b $1
  fi
}

alias master="goto master"

# Docker aliases:
alias d="docker"
alias di="docker image"
alias dc="docker container"
alias dl="eval $(docker-machine env default)"
alias dk="eval $(minikube docker-env)"

db() {
  if [ $1 = '-d' ]; then
    dc stop $2; dc rm $2
  else
    docker run --name $1 -d -p $2:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres
  fi
}

dbr() {
  dc stop $1; dc rm $1; db $1 $2
}

# Connect to local/docker postgres
alias dp="psql -h localhost -U postgres"

# Kubectl and Minikube aliases:
alias k="kubectl"
alias m="minikube"
alias md="minikube dashboard"

# Tmux aliases:
alias tns="tmux new -s"
alias ts="tmux attach -t"
alias tls="tmux list-sessions"
alias tpn="printf '\033]2;%s\033\\' '$1'"

# Golang remove vendor:
alias rmv="rm -rf vendor/ Gopkg.lock"

# Reset and update Go project github repo using dep:
alias gup="gira; down; rmv; dep ensure -v"

# Port function which tells whether a port is used or not. Usage: port 8080
port() {
  lsof -i ":$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
