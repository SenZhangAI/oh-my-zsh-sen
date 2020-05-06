# This is a very personal setting, maybe few people like it, so I config it separatedly.

#alias
if which nvim>/dev/null 2>&1; then
    alias vi='nvim'
    export EDITOR='nvim'
elif which vim>/dev/null 2>&1; then
    alias vi='vim'
    export EDITOR='vim'
fi

export GO111MODULE=auto
export GOPROXY=https://goproxy.io

case $OSTYPE in
    cygwin*)
        # Go environment
        export PATH=$PATH:/cygdrive/c/go/bin
        GOBASEPATH="$HOME/GoWorkSpace"
        GOPATH_WIN=`cygpath -a -w $GOBASEPATH`
        GOBIN_WIN=`cygpath -a -w $GOBASEPATH/bin`
        export GOPATH="$GOPATH_WIN"
        export GOBIN="$GOBIN_WIN"
        export PATH="$PATH:$GOBASEPATH/bin"
        ;;
    linux*)
        # Go environment
        [ -s "/usr/local/go" ] && export PATH=$PATH:/usr/local/go/bin
        GOBASEPATH="$HOME/GoWorkSpace"
        export GOPATH="$GOBASEPATH"
        export PATH="$PATH:$GOBASEPATH/bin"

        if [ -d "/usr/local/maven" ]; then
            MAVEN_HOME=/usr/local/maven
            export PATH=$PATH:${MAVEN_HOME}/bin
        fi
        ;;
    darwin*)
        # Go environment
        [ -s "/usr/local/go" ] && export PATH=$PATH:/usr/local/go/bin
        GOBASEPATH="$HOME/GoWorkSpace"
        export GOPATH="$GOBASEPATH"
        export PATH="$PATH:$GOBASEPATH/bin"
        ;;
esac

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    SESSION_NAME="remotetmux"
    tmux attach-session -t $SESSION_NAME || tmux new-session -s $SESSION_NAME
fi

