#set -o vi

export PATH=$PATH:$HOME/.local/bin

# some more ls aliases
alias ls='ls -Fh'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# stands for 'git branch'
alias gb='git branch -vv'
# stands for 'git fetch interested'
alias gf='git fetch origin master'
#alias gf='git fetch origin main;git fetch origin master'
# stands for 'git log'
alias gl='git log --pretty=format:"%Cred%h%Creset %C(bold blue)<%an>%Creset %s"'

source $HOME/.fzf/shell/completion.bash
source $HOME/.fzf/shell/key-bindings.bash

