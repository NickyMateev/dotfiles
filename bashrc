# PATH variables
export PATH="/Users/i335693/mvn/apache-maven-3.5.0/bin:$PATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
export PATH="/usr/local/share/python:$PATH"
export PATH="/Users/i335693/Applications\ &\ Services/diff-so-fancy:$PATH"
export PATH="~/sm-cli/:$PATH"
export GOPATH="$HOME/Documents/GoWorkspace"
export PATH="/Users/i335693/Documents/GoWorkspace/bin:$PATH"
export PATH="/anaconda3/bin:$PATH"
export GITPATH="$HOME/Documents/GitHub/NickyMateev"


# Git aliases
alias gs="git status"
alias ga="git add"
alias gm="git commit"
alias up="git push"
alias down="git pull"
alias goto="git checkout $1"
alias gf="git diff"
alias gl="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias gira="git reset HEAD --hard"

# Docker aliases
alias d="docker"
alias di="docker images"
alias dp="docker ps"
alias dl="eval $(docker-machine env default)"
alias dk="eval $(minikube docker-env)"
alias dps="docker run --name postgres-docker -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres"

# Kubectl and Minikube aliases
alias k="kubectl"
alias m="minikube"

# Tmux aliases
alias tns="tmux new -s"
alias tas="tmux attach -t"
alias tls="tmux list-sessions"

# Port function which tells whether a port is used or not. Usage: port 8080
port() {
  lsof -i ":$1"
}

# .bash_profile aliases
alias les="less ~/.bash_profile"
eles() {
  vim ~/.bash_profile
  cp ~/.bash_profile ~/.bashrc
  cp ~/.bash_profile $GITPATH/dotfiles/bashrc
  . ~/.bashrc
}

# Inject docker environment variables
eval $(docker-machine env default)
