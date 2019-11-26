#export
# may need to manually set language environment
export LANG=en_US.UTF-8
#export LC_CTYPE="en_US.UTF-8"
#export JAVA_HOME=/usr/lib/jvm/java-7-icedtea
#export JAVA_OPTS='-Dfile.encoding=UTF-8'
#export PYTHONSTARTUP=$HOME/.pythonrc.py

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

#alias
if which nvim>/dev/null 2>&1; then
    alias vi='nvim'
elif which vim>/dev/null 2>&1; then
    alias vi='vim'
fi

alias df='df -h'
alias du='du -hs'
alias ps='ps -ef'
#@see <http://blog.chinaunix.net/uid-11640640-id-2139790.html>
alias ctagsCpp='ctags -R --languages=c++ --c++-kinds=+px --fields=+aiKSz --extra=+fq'
alias cscopeRbq='cscope -Rbq'
alias astyleCpp='astyle --mode=c --style=java -n -s4 -xW -xC120 -xL -NOowypcfHU -k1'
alias -s tar='tar -xvf'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'
alias -s rar='unrar x'
alias -s xz='xz -d'
alias -s xz='7z e'
alias cmakeDebug='cmake -DCMAKE_BUILD_TYPE=Debug'

alias gskip='git update-index --skip-worktree'
alias gunskip='git update-index --no-skip-worktree'

alias npm='npm --registry https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist'

alias chef-init='eval "$(chef shell-init zsh)"'
alias rvm-init='if [ -d $HOME/.rvm/scripts ]; then source $HOME/.rvm/scripts/rvm; else echo "$HOME/.rvm/scripts not found"; fi'

# set PATH so it includes user's private when $HOME/bin exists
if [ -d "$HOME/node_modules/.bin" ] ; then
    export PATH="$HOME/node_modules/.bin:$PATH"
fi

if [ -d "$HOME/bin" ] ; then
    export PATH="$PATH:$HOME/bin"
fi

if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] ; then
    #alias nix-init='. $HOME/.nix-profile/etc/profile.d/nix.sh'
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Fix problem in tilix,see https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# TODO
#export LDFLAGS="-L/usr/local/opt/llvm/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include"

# fix tmux color
[ -n "$TMUX" ] && export TERM="xterm-256color"

#rustup mirror
#export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# config [less]
#-X leaves file contents on the screen when less exits.
#-F makes less quit when the entire output can be displayed on one screen.
#-R displays ANSI color escape sequences in "raw" form.
#-S disables line wrapping. Side-scroll to see long lines.
export LESS="-XRFS"

export GO111MODULE=auto
export GOPROXY=https://goproxy.io

case $OSTYPE in
    cygwin*)
        alias ep='explorer'
        # Go environment
        export PATH=$PATH:/cygdrive/c/go/bin
        GOBASEPATH="$HOME/GoWorkSpace"
        GOPATH_WIN=`cygpath -a -w $GOBASEPATH`
        GOBIN_WIN=`cygpath -a -w $GOBASEPATH/bin`
        export GOPATH="$GOPATH_WIN"
        export GOBIN="$GOBIN_WIN"
        export PATH="$PATH:$GOBASEPATH/bin"
        # change cursor to blinking block
        echo -ne "\x1b[1 q"
        # start gdb
        export CYGWIN="$CYGWIN error_start=gdb -nw %1 %2"
        # generate core dump
        export CYGWIN="$CYGWIN error_start=dumper -d %1 %2"
        ZSH_THEME="ys";;
    linux*)
        # Go environment
        [ -s "/usr/local/go" ] && export PATH=$PATH:/usr/local/go/bin
        GOBASEPATH="$HOME/GoWorkSpace"
        export GOPATH="$GOBASEPATH"
        export PATH="$PATH:$GOBASEPATH/bin"
        # Virtual Terminal Emulator
        if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
            source /etc/profile.d/vte.sh
        fi
        ZSH_THEME="ys";;
    darwin*)
        alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
        alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
        alias MacDown='/Applications/MacDown.app/Contents/MacOS/MacDown'
        alias Typora='/Applications/Typora.app/Contents/MacOS/Typora'
        # Go environment
        [ -s "/usr/local/go" ] && export PATH=$PATH:/usr/local/go/bin
        GOBASEPATH="$HOME/GoWorkSpace"
        export GOPATH="$GOBASEPATH"
        export PATH="$PATH:$GOBASEPATH/bin"
        # Anaconda
        export PATH="$PATH:/anaconda3/bin"
        export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
        export NVM_DIR=~/.nvm
        alias nvm-init='source $(brew --prefix nvm)/nvm.sh'
        # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-cask.git
        export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
        export HOMEBREW_NO_AUTO_UPDATE=true
        ZSH_THEME="ys";;
esac

if [[ -n "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    SESSION_NAME="remotetmux"
    tmux attach-session -t $SESSION_NAME || tmux new-session -s $SESSION_NAME
fi
