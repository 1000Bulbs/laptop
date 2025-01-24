#!/bin/bash
# A script to more efficiently change branches using the Git CLI

declare -a changes=( $(git diff-index --name-only HEAD --) )
declare -a presently=( $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/') )
declare -a branches=( $(git branch | sed 's/[\* ]//g' | sed 's/remotes\/origin\///' | sort | uniq) )

available=${#branches[@]}

if [ -n "$changes" ]; then
    echo -e "\n*** CLEAR YOUR CHANGES FIRST ***\n"
    git status
else
    echo -e "There are ${available} branches presently available\n"

    PS3=$'\n'"Select a branch: $REPLY"

    COLUMNS=0
    select opt in ${branches[@]}; do
        if (( 0 < REPLY && REPLY <= available )); then
	    git checkout $opt
            break
        else
            echo -e "\nINVALID selection"
            continue
        fi
    done
fi
