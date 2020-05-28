#!/usr/bin/env bash

function gi() {
    curl curl -L -s https://www.gitignore.io/api/$@ ;
}

function mkd() {
    mkdir -p "$@" && cd "$_";
}
