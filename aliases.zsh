#!/usr/bin/env bash

function gi() { curl curl -sL https://www.gitignore.io/api/$@ ;}

# Shortcuts
alias myip="curl ifconfig.io"
alias reloadshell="source $HOME/.zshrc"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/Projects"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Git
alias amend="git commit --amend --no-edit"
alias unstage="git restore --staged ."

# RSPNDR
alias rspndr-uuid="uuidgen | tr \"[:upper:]\" \"[:lower:]\" | pbcopy"
alias rspndr-inst="/usr/local/bin/aws-list-instances"
alias rspndr-ssh="/usr/local/bin/aws-ssh"
