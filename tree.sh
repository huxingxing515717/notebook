#!/bin/bash

tree=$(tree --dirsfirst -f --noreport -I '*~' --charset ascii $1 |
	sed -e 's/| / /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g' |
	grep -v -x '.' | grep -v 'README.md' | grep -v '.png' | grep -v '     ')

printf "# Notebook\n\n${tree}" | sed "s/.md]/]/g"
