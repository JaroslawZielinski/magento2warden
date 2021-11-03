#!/bin/bash

function ::() {
    printf "\n %s : %s\n=======================================\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$1"
}
. .env
