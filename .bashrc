PATH="$HOME/environment/cloud9-stuff/bin:$PATH"

export LC_ALL=en_US.utf8
export LANG=en_US.utf8

if [ -e ~/environment/bashrc.local ]
then
  source ~/environment/bashrc.local
fi

alias gst='git status'
alias gf='git fetch'
alias gco='git checkout'
alias gfm='git pull'
alias gfr='git pull --rebase'
alias gc='git commit -v'
alias gaa='git add -A'
alias ga='git add'
alias gp='git push'

# Replace Bash shell with Fish
if [ -n "$C9_USER" ] && [ -z "$BASH_REPLACED_WITH_FISH" ]
then
  export BASH_REPLACED_WITH_FISH=1
  exec fish
fi
