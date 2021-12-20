#! /bin/sh
#
# This script switches to the main branch of the current repository
# and does a git pull on main, then switches the user back to the current
# branch and then merges in main.
#

CURRENT_BRANCH=$(cat .git/HEAD | cut -d '/' -f 3)
gco main && git pull origin main
gco CURRENT_BRANCH
git merge main

