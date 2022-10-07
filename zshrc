export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

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
export GITPATH="$HOME/SAPDevelop/GitHub"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
#export PATH=$HOME/mvn/apache-maven-3.5.0/bin:$PATH
export PATH="/opt/homebrew/opt/maven@3.5/bin:$PATH"
export PATH=$HOME/scripts:$GITPATH/github.com/NickyMateev/dotfiles/scripts:$PATH
export PATH="$HOME/SAPDevelop/go/bin:$PATH"
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/.ghcup/env:$PATH"
export PATH="$HOME/.config/wtf/scripts:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME=/Users/i335693/Downloads/jdk-11.0.15.jdk/Contents/Home
export GOPATH="$HOME/SAPDevelop/go"
export EDITOR="/usr/bin/vim"
export BAT_THEME="Visual Studio Dark+"

# Aliases:

alias ls="logo-ls"

alias v="vim"
alias vim="nvim"
alias vwiki="vim ~/vimwiki/index.wiki"

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Edit zsh config, add to the dotfiles repo the newest config version and finally run it:
zshconfig() {
	vim ~/.zshrc
	cp ~/.zshrc $GITPATH/github.com/NickyMateev/dotfiles/zshrc
	. ~/.zshrc
}

alias q="exit"
alias s="sudo"
alias t="todoist"

# Git aliases:
alias gc="git clone"
alias gs="git status"
alias gsh="git stash"
alias gsa="git stash apply"
alias ga="git add"
alias gm="git commit"
alias gam="git commit -a -m"
alias up="git push"
#alias upp="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
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

alias main="goto main"
alias merge="git merge main"
alias master="goto master"
alias mergem="git merge master"

# Docker aliases:
alias d="docker"
alias di="docker image"
alias dc="docker container"

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

psqlc() {
	psql -d director -h localhost -p 5432 -U director -c $1
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

# cURL:
alias curltime="curl -w \"@$HOME/.curl-format.txt\" -o NUL -s "

# Golang remove vendor:
alias rmv="rm -rf vendor/ Gopkg.lock"

# Reset and update Go project github repo using dep:
alias gup="gira; down; rmv; dep ensure -v"

jwt() {
	jq -R 'split(".") | .[0] | @base64d | fromjson' <<< "$1"
	jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
}

jsonlogs() {
	if [ -z "$1" ] || [ -z "$2" ]; then
		pbpaste | sed '/^$/d' | sed '$!s/$/,/' | sed '1 s/./[&/' | sed '$s/$/]/' | jq
	else
		pbpaste | sed '/^$/d' | sed '$!s/$/,/' | sed '1 s/./[&/' | sed '$s/$/]/' | jq -c '[ .[] | select(."'$1'" | contains("'$2'")) ]' | jq
	fi
}

# Port function which tells whether a port is used or not. Usage: port 8080
port() {
	lsof -i ":$1"
}

# Cert function opens the server certificate of a given host by it's URL in user-friendly way. Usage: cert google.com
cert() {
	echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text
}

# Move binary to /usr/local/bin:
mvbin() {
	BINARY_PATH="$1"
	BINARY_NAME=$(echo "$BINARY_PATH" | rev | cut -d "/" -f1 | rev)
	sudo mv $BINARY_PATH /usr/local/bin/$BINARY_NAME
}

# Make new dir and enter it:
mdir () {
	mkdir -p "$@" && cd "$1";
}

tmux-init() {
	tmux new -s sap -d
	tmux new -s labsi -d
	tmux new -s sandbox -d

	tmux rename-window -t sap:0 '🧭 compass'
	tmux new-window -n '📜 management-plane-config' -t sap
	tmux new-window -n '⚙️  test-infra' -t sap
	tmux new-window -n '📝 LSS' -t sap
	tmux new-window -n '📟 Cockpit' -t sap

	tmux send-keys -t "sap:🧭 compass" 'cd' Enter
	tmux send-keys -t "sap:🧭 compass" 'cd $GITPATH/github.com/kyma-incubator/compass' Enter
	tmux send-keys -t "sap:📜 management-plane-config" 'cd $GITPATH/github.tools.sap/cmp/management-plane-config' Enter
	tmux send-keys -t "sap:⚙️  test-infra" 'cd $GITPATH/github.com/kyma-project/test-infra' Enter
	tmux send-keys -t "sap:📝 LSS" 'cd $GITPATH/github.tools.sap/cloudfoundry/product-cf-hcp' Enter
	tmux send-keys -t "sap:📟 Cockpit" 'cd $GITPATH/github.wdf.sap.corp/NGJP/JPaaS/com.sap.core.account' Enter

	tmux rename-window -t labsi:0 '📲 mobile-app'
	tmux new-window -n '🚪 api-gateway' -t labsi
	tmux new-window -n '🔐 auth-server' -t labsi

	tmux send-keys -t "labsi:📲 mobile-app" 'cd $GITPATH/github.com/labsi-eu/labsi_mobile_app' Enter
	tmux send-keys -t "labsi:🚪 api-gateway" 'cd $GITPATH/github.com/labsi-eu/labsi-api-gateway' Enter
	tmux send-keys -t "labsi:🔐 auth-server" 'cd $GITPATH/github.com/labsi-eu/labsi-auth-server' Enter

	tmux rename-window -t sandbox:0 '🏝 main'
	tmux send-keys -t "sandbox:🏝 main" 'cd' Enter

	if [ -z "$1" ]; then
		tmux attach -t sandbox
	else
		tmux attach -t $1
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Use github.com/sachaos/todoist with fzf
source $GITPATH/github.com/sachaos/todoist/todoist_functions_fzf.sh

# Configuration for kube-ps1
source $GITPATH/github.com/jonmosco/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SYMBOL_USE_IMG=true
KUBE_PS1_CTX_COLOR=red
KUBE_PS1_SEPARATOR='| '

function get_cluster_short() {
	if [[ $1 == *sap-cp-cmp-dev ]]; then
		echo "sap-cp-cmp-dev"
	elif [[ $1 == *cmp-dev-main ]]; then
		echo "cmp-dev-main"
	elif [[ $1 == *cmp-dev-validation ]]; then
		echo "cmp-dev-validation"
	elif [[ $1 == *cmp-dev-testing ]]; then
		echo "cmp-dev-testing"
	elif [[ $1 == *cmp-stage ]]; then
		echo "cmp-stage"
	elif [[ $1 == *cmp-prod ]]; then
		echo "cmp-prod"
	else
		echo "$1"
	fi
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

# zsh auto-completion for kubectl: https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/
source <(kubectl completion zsh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/i335693/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/Users/i335693/opt/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/Users/i335693/opt/anaconda3/etc/profile.d/conda.sh"
	else
		export PATH="/Users/i335693/opt/anaconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/i335693/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/i335693/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/i335693/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/i335693/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


# Load Angular CLI autocompletion.
source <(ng completion script)
