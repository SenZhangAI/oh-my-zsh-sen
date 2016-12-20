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
  export EDITOR='vim'
fi

#alias
alias vi='vim'
alias df='df -h'
alias du='du -hs'
alias ps='ps -ef'
#@see <http://blog.chinaunix.net/uid-11640640-id-2139790.html>
alias ctagsCpp='ctags -R --languages=c++ --c++-kinds=+px --fields=+aiKSz --extra=+fq'
alias cscopeRbq='cscope -Rbq'
alias astyleCpp='astyle --mode=c --style=java -n -s4 -xW -xC120 -xL -NOowypcfHU -k1'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# plugins should be modified in [.zshrc]
# because this file is sourced after all plugins sourced.
# more details are discirbed in sen.sourcePlugins.zsh
case $OSTYPE {
  cygwin*)
    alias ep='explorer'

    # Go environment
    export PATH=$PATH:/cygdrive/c/Go/bin
    #below settings need more test
    #export GOPATH=d:\\Cygwin\\home\\Sen\\GoWorkSpace
    #export GOBIN=d:\\Cygwin\\home\\Sen\\GoWorkSpace\\bin

    # change cursor to blinking block
    echo -ne "\x1b[1 q"
    # start gdb
    export CYGWIN="$CYGWIN error_start=gdb -nw %1 %2"
    # generate core dump
    export CYGWIN="$CYGWIN error_start=dumper -d %1 %2"
    ZSH_THEME="ys";;
    # if use zsh-syntax-highlighting, it MUST be the last plugin sourced
    # plugins MUST config in .zshrc
    #plugins=(git z vi-mode);;
  linux*)
    # Go environment
    export PATH="$PATH:/usr/local/go/bin"
    export GOPATH="$HOME/GoWorkSpace"
    export GOBIN="$GOPATH/bin"

    ZSH_THEME="ys";;

  darwin*)
    ZSH_THEME="ys";;
  }
