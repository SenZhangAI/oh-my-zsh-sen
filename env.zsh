#export
# may need to manually set language environment
export LANG=en_US.UTF-8
#export LC_CTYPE="en_US.UTF-8"
#export PYTHONSTARTUP=$HOME/.pythonrc.py

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
alias -s 7z='7z e' # TODO 7z文件如何解压，mac中有p7zip 命令行工具
alias cmakeDebug='cmake -DCMAKE_BUILD_TYPE=Debug'

alias gskip='git update-index --skip-worktree'
alias gunskip='git update-index --no-skip-worktree'

alias npm='npm --registry https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist'

alias chef-init='eval "$(chef shell-init zsh)"'
alias rvm-init='if [ -d $HOME/.rvm/scripts ]; then source $HOME/.rvm/scripts/rvm; else echo "$HOME/.rvm/scripts not found"; fi'

# set PATH so it includes user's private when $HOME/bin exists
[ -d "$HOME/node_modules/.bin" ] && export PATH="$HOME/node_modules/.bin:$PATH"

[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"

if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] ; then
    #alias nix-init='. $HOME/.nix-profile/etc/profile.d/nix.sh'
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# Fix problem in tilix,see https://gnunn1.github.io/tilix-web/manual/vteconfig/
[ $TILIX_ID ] || [ $VTE_VERSION ] && source /etc/profile.d/vte.sh

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

case $OSTYPE in
    cygwin*)
        alias ep='explorer'
        # change cursor to blinking block
        echo -ne "\x1b[1 q"
        # start gdb
        export CYGWIN="$CYGWIN error_start=gdb -nw %1 %2"
        # generate core dump
        export CYGWIN="$CYGWIN error_start=dumper -d %1 %2"

        ;;
    linux*)
        # Virtual Terminal Emulator
        if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
            source /etc/profile.d/vte.sh
        fi
        #JAVA
        [ -d "/etc/alternatives/java_sdk/bin" ] && export JAVA_HOME="/etc/alternatives/java_sdk"
        if [ "$JAVA_HOME" != "" ]; then
            export JAVA_OPTS='-Dfile.encoding=UTF-8'
            export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
            export PATH=$JAVA_HOME/bin:$PATH
        fi

        ;;
    darwin*)
        alias subl='open -a "Sublime Text"'
        alias code='open -a "Visual Studio Code"'
        alias MacDown='open -a MacDown'
        alias Typora='open -a Typora'
        # Anaconda
        export PATH="$PATH:/anaconda3/bin"
        export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
        export NVM_DIR=~/.nvm
        alias nvm-init='source $(brew --prefix nvm)/nvm.sh'
        # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-cask.git
        export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
        export HOMEBREW_NO_AUTO_UPDATE=true

        # https://sdkman.io/usage
        [ -d "$HOME/.sdkman" ] && alias sdk 'source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk'
        ;;
esac

