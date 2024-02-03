#!/usr/bin/env bash

# Installs pre-commit hooks.
#
# Deals with situation when some global hooks are already installed

current_dir=$( dirname "$0" )
# shellcheck disable=SC1091
source "${current_dir}/common.sh"

command_exists git "https://git-scm.com/downloads"
command_exists pre-commit "https://pre-commit.com/#installation"

hooks_path=$( git config --global core.hooksPath )
exit_code=$?
if [ "${exit_code}" == "0" ]; then
    echo "Removing core.hooksPath; it was ${hooks_path}";
    git config --global --unset-all core.hooksPath
fi;

echo "Install pre-commit hooks"
pre-commit install

if [ "${exit_code}" == "0" ]; then
    echo "Restoring core.hooksPath; it will be ${hooks_path}";
    git config --global core.hooksPath "${hooks_path}"
fi;
