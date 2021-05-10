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

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Git
alias amend="git commit --amend --no-edit"
alias unstage="git restore --staged ."

# JS
alias nfresh="rm -rf node_modules/ && npm install"
alias watch="npm run watch"

# RSPNDR
alias rspndr-uuid="uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' | pbcopy"
alias rspndr-inst="'$DOTFILES/rspndr/aws-list-instances'"
alias rspndr-ssh="'$DOTFILES/rspndr/aws-ssh'"
alias rspndr-org="'$DOTFILES/rspndr/org-cache'"
