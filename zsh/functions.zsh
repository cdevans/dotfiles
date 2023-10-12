#!/usr/bin/env zsh

function gi() {
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;
}

function mkd() {
    mkdir -p "$@" && cd "$_";
}
