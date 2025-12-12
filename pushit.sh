#!/usr/bin/env bash
#
# Script name: pushit.sh
# Description: Script for pushing changes to dtos-core-repo to GitLab.
# GitLab: https://www.gitlab.com/dtos/dtos-core-repo
# Contributors: Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

BOLD='\e[1m'
GREEN='\e[92m'
RED='\e[91m'
YELLOW='\e[93m'
RESET='\e[0m'

print_info () {
    echo -ne "${BOLD}${YELLOW}$1${RESET}\n"
}
git status
git add -u && print_info "Git add updated files in this directory."
git add * && print_info "Git add all files in this directory."
git commit -m "Updating database." && print_info "Commit Message: Updating database."
git push && print_info "Git push completed."

