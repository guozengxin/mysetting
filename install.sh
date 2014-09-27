#!/bin/sh

now=`pwd`
list="gitconfig vimrc vim octaverc"
for l in $list; do
	ln -sf $now/$l ~/.${l}
done
