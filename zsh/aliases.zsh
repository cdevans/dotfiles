#!/usr/bin/env zsh

# Shortcuts
alias myip="curl ifconfig.io"
alias reloadshell="source $HOME/.zshrc"

# Directories
alias dl="cd $HOME/Downloads"
alias dt="cd $HOME/Desktop"
alias proj="cd $HOME/Projects"
alias library="cd $HOME/Library"
alias icldr="cd '$ICLOUD_DRIVE'"
alias dotfiles="cd '$DOTFILES'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Git
alias amend="git commit --amend --no-edit"
alias unstage="git restore --staged ."

# JS
alias nfresh="rm -rf node_modules/ && npm install"
alias watch="npm run watch"

# Utility
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' | pbcopy"
