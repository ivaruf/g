#!/bin/bash

function lookup() {
	git reflog | grep 'moving from' | sed 's .*\(moving.from.*\) \1 ' | sed 's/^.*to //' | tr ' ' '\n' | awk '!x[$0]++' | head -$1

}

function checkout() {
	lookup 100 | sed -n "$1 p" | xargs git checkout
}

if [[ $1 == "co" ]]
then
	checkout $2
else
	lookup $1 | nl
fi
