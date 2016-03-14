#!/bin/sh

now=`pwd`
list="gitconfig vimrc vim"
for l in $list; do
	ln -sf $now/$l ~/.${l}
done

mkdir -p ~/bin/
list="jgrep pygrep cgrep gogrep bt"
for l in $list; do
	ln -sf $now/bin/$l ~/bin/${l}
done
