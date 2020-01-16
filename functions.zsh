function print-env() {
    index=1
    for arg in $*
    do
        echo "$arg = \"$(printenv $arg)\""
        let index+=1
    done
    unset index
}

function proxy-enable() {
    if [ -z "$1" ];then
        _PROXY_PORT="1087"
    else
        _PROXY_PORT=$1
    fi
    export HTTP_PROXY="http://127.0.0.1:$_PROXY_PORT"
    export HTTPS_PROXY="http://127.0.0.1:$_PROXY_PORT"
    export ALL_PROXY="http://127.0.0.1:$_PROXY_PORT"
    print-env HTTP_PROXY HTTPS_PROXY ALL_PROXY
    unset _PROXY_PORT
}

function proxy-disable() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ALL_PROXY
}

