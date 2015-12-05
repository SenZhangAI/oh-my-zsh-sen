#export
# may need to manually set language environment
#export LANG=zh_CN.UTF-8
#export LC_CTYPE="zh_CN.UTF-8"

#export JAVA_HOME=/usr/lib/jvm/java-7-icedtea
#export JAVA_OPTS='-Dfile.encoding=UTF-8'
#export PYTHONSTARTUP=$HOME/.pythonrc.py

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

#alias
alias vi='vim'
alias df='df -h'
alias du='du -hs'

case $OSTYPE {
    cygwin*)
        ZSH_THEME="ys"
        # if use zsh-syntax-highlighting, it MUST be the last plugin sourced
        plugins=(git z vi-mode);;
    linux*)
        ZSH_THEME="gentoo"
        plugins=(git z vi-mode zsh-syntax-highlighting);;
    darwin*)
        ZSH_THEME="ys"
        plugins=(git osx ruby brew);;
}

