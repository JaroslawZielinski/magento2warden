#!/bin/bash

function ::() {
    printf "\n %s : %s\n=======================================\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$1"
}
# @see https://stackoverflow.com/a/66118031/339144
set -a
source <(cat .env | \
    sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")
set +a
