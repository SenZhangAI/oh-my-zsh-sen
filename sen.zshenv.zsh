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
  export EDITOR='nvim'
fi

#alias
alias vi='vim'
alias nv='nvim'
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
alias cmakeDebug='cmake -DCMAKE_BUILD_TYPE=Debug'

alias npm='npm --registry https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  export PATH="$PATH:$HOME/bin"
fi

# Fix problem in tilix,see https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

# plugins should be modified in [.zshrc]
# because this file is sourced after all plugins sourced.
# more details are discirbed in sen.sourcePlugins.zsh
case $OSTYPE {
  cygwin*)
    alias ep='explorer'

    # Go environment
    export PATH=$PATH:/cygdrive/c/Go/bin

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
    GOBASEPATH="$HOME/GoWorkSpace"
    export GOPATH="$GOBASEPATH"
    export PATH="$PATH:$GOBASEPATH/bin"
    # if rvm scripts exists, run it
    [[ -s "$HOME/.rvm/scripts/rvm"  ]] && . "$HOME/.rvm/scripts/rvm"

    # for Virtual Terminal Emulator
    if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
      source /etc/profile.d/vte.sh
    fi

    ZSH_THEME="ys";;

  darwin*)
    alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
    alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
    # Go environment
    GOBASEPATH="$HOME/GoWorkSpace"
    export GOPATH="$GOBASEPATH"
    export PATH="$PATH:$GOBASEPATH/bin"
    # if rvm scripts exists, run it
    [[ -s "$HOME/.rvm/scripts/rvm"  ]] && . "$HOME/.rvm/scripts/rvm"

    ZSH_THEME="ys";;
}
