export ZSH=$HOME/.oh-my-zsh

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

source ~/dev/dotfiles/home_folder_links/bash_aliases # all aliases are here


export K8S_USERNAME=your_username
export K8S_TOKEN=yout_token
export VAULT_PKI_ROLE=dev


k8s-ns() {
  kubectl config set-context $(kubectl config current-context) --namespace=$1
}

check-blacklist(){
  python3 /home/henrique/dev/personal/personal/python/check-ip-blacklist.py $1
}

liberaip(){
  curl -X DELETE 'http://not-today.kube.aws.elo7.io/v1/attackers/blacklist/$1' > /dev/null 2>&1
}

bloquear-sites(){
  sudo python3 $HOME/dev/block-website/block.py $1
}

searchDomain(){
  ~/dev/dotfiles/scripts/aws/route-53.sh $1
}



export TERM="xterm-256color"
ZSH_THEME="simple"

setopt RM_STAR_WAIT

setopt interactivecomments

CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git kubectl sudo pip pyenv pylint python ssh-agent tmux git-extras)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cls="clear"
alias staging="usshu 172.18.44.236"
alias k8s-login="/home/henrique/dev/dotfiles/scripts/k8s/configure-k8s.sh && /home/henrique/dev/dotfiles/scripts/k8s/configure-k8s-us.sh"
alias elo7ctl="usshc 172.18.18.11"
alias k8s-env-sa="kubectl config use-context k8s-prod"
alias k8s-env-us="kubectl config use-context k8s-prod-us"
alias zshreload="source ~/.zshrc"
unalias k
alias k="kubectl"
unalias sshp
alias sshp='ssh -i ~/dev/keys/pay7/pay7.pem -l core'
alias sshaws='ssh -i ~/dev/keys/sa-default-key.pem -l ec2-user' 
alias vpnelo7="sudo openvpn /home/henrique/dev/personal/keys/vpn/henrique.fernandes-lin.ovpn"
alias vpnpay7="sudo openvpn /home/henrique/dev/personal/keys/pay7/pay7/pay7_client7.ovpn"
alias tmux-bar-conf="vim ~/.tmux/plugins/tmux-themepack/basic.tmuxtheme"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin"
export PATH="$PATH:/Users/developer/Library/Python/3.7/bin"