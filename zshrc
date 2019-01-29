export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  docker
)

# Ignore these permission issues and load the completion system normally:
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration:

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/mvn/apache-maven-3.5.0/bin:$PATH
export PATH=$HOME/svcat:$HOME/smctl:$PATH
export PATH="$HOME/go/bin:$PATH"

export GITPATH="$HOME/Documents/GitHub"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home
export GOPATH="$HOME/go"

# Aliases:

# Edit zsh config, add to the dotfiles repo the newest config version and finally run it:
zshconfig() {
  vim ~/.zshrc
  cp ~/.zshrc $GITPATH/NickyMateev/dotfiles/zshrc
  . ~/.zshrc
}

# Git aliases:
alias gc="git clone"
alias gs="git status"
alias ga="git add"
alias gm="git commit"
alias gam="git commit -a -m"
alias up="git push"
alias upp="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias down="git pull"
alias goto="git checkout $1"
alias gf="git diff"
alias gl="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias gira="git reset HEAD --hard"

# Docker aliases:
alias d="docker"
alias di="docker image"
alias dc="docker container"
alias dl="eval $(docker-machine env default)"
alias dk="eval $(minikube docker-env)"
alias dps="docker run --name postgres-docker -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres"

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

# Port function which tells whether a port is used or not. Usage: port 8080
port() {
  lsof -i ":$1"
}

# Inject docker environment variables:
eval $(docker-machine env default)
