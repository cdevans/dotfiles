#!/usr/bin/env zsh

function gi() {
    curl curl -L -s https://www.gitignore.io/api/$@ ;
}

function mkd() {
    mkdir -p "$@" && cd "$_";
}
