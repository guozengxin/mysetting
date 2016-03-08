alias ll='ls -al'
alias ls='ls --color'
alias vi='vim'

function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

# export PS1='\[\033[32m\]\u \[\033[34m\]\w\[\033[31m\] $(parse_git_branch)\[\033[00m\]$ '
# export PS1="\[\e[32m\][\u@\h \w]$\[\e[m\] > "
# export PS1="`a=$?;if [ $a -ne 0 ]; then echo -n -e "\[\e[01;32;41m\]{$a}"; fi`\[\033[01;32m\]\u \[\033[01;34m\]\w `b=$(parse_git_branch); if [ x"$b" != "x" ]; then echo -n -e "\[\e[33;40m\](branch:$b)\[\033[01;32m\]\[\e[00m\]"; fi`\[\033[01;34m\] $ \[\e[00m\]"
