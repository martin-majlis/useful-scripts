#!/usr/bin/env bash

function command_exists {
    if ! command -v "${1}" &> /dev/null; then
        echo "Command \"${1}\" could not be found. Please, install it - ${2}."
        exit 1
    fi
}
