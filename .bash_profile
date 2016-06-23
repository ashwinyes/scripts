########################################################
# SETTING THE ENV VARS
########################################################
export TERM=xterm
export CSCOPEVER=OS
export CSCOPE_EDITOR=vim
LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

########################################################
# SETTING THE PROMPT
########################################################
#export PS1="\e[0;31m[\u@\h \W]\$ \e[m "
#export PS1="\[$(tput sgr0)(\e[0;31m\d \t\e[m)(\e[0;31m\u@\h\e[m):\e[0;32m\w\e[m\n$ \[$(tput setaf 7)\]"
export PS1="\[$(tput sgr0)(\e[0;31m\$(hostname -I|sed -e 's/^ *//' -e 's/ *$//')\e[m:\e[0;36m\$(date)\e[m):\e[0;32m\w\e[m\n$ \[$(tput setaf 8)\]"
#export PS1="\[$(tput sgr0)(\e[0;31m\d \t\e[m)(\e[0;31m\u@\h\e[m)(\e[0;31m\$(hostname -I|sed -e 's/^ *//' -e 's/ *$//')\e[m):\e[0;32m\w\e[m\n$ \[$(tput setaf 8)\]"
#export PS1=$`pwd`$

########################################################
# Aliases
########################################################
alias ll='ls -al'
alias ls='ls --color'
alias cls='clear'
#alias showcmd='grep -Rif - /PATH_TO/commands.txt <<<'
#alias addcmd='echo >> /PATH_TO/commands.txt'