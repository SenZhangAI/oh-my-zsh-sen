#!/usr/bin/env bash

RED() {
    printf "\033[31m$1\033[0m"
}

# ********************************************************************
# check install
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    printf "$(RED "Zsh is not installed!") Please install zsh first!\n"
    exit
fi
unset CHECK_ZSH_INSTALLED

if [ ! -n "$ZSH" ]; then
    ZSH=~/.oh-my-zsh
fi


if [ ! -n "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM=~/.oh-my-zsh/custom
fi

if [ ! -d "$ZSH" ]; then
    printf "You may not install ${YELLOW}[Oh-My-Zsh]${NORMAL}.\n"
    printf "You need to install it first.\n"
    exit
fi

# get INSTALLER_DIR
INSTALLER_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# ********************************************************************
# install start
echo '****************************************************************'
echo 'Install start...'

if [ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
    echo ' + [plugin]: zsh-syntax-highlighting'
    git clone --depth=1 git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
    echo ' + [plugin]: zsh-autosuggestions'
    git clone --depth=1 git://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

echo ' + [plugin]: themes'
cp -rf $INSTALLER_DIR/plugins/themes $ZSH_CUSTOM/plugins/

add_config() {
    echo " + [config]: $1"
    cp $INSTALLER_DIR/$1 $ZSH_CUSTOM
}

add_config env.zsh
add_config config.zsh
add_config functions.zsh
add_config tldr.complete.zsh

if [[ $# > 0 && $1 == 'sen' ]]; then
    add_config sen.zsh
fi

# set plugins
## remove comments of leading '#'
_plugins=$(sed '/^#.*/d' $INSTALLER_DIR/plugins.conf)
## combine multilines into single line
plugins=$(echo $_plugins | perl -pe 's/\n//g') && unset _plugins

## vi-mode is my favorite, so I will install it for myself
if [[ $# > 0 && $1 == 'sen' ]]; then
    if [[ ! $plugins =~ 'vi-mode' ]]; then
        plugins="vi-mode "$plugins
    fi
fi

printf "\nSet plugins from [plugins.conf]\n"
echo "plugins=("
echo "    $plugins"
echo ")"
perl -i -0pe 's/(^\s*plugins\s*=\s*\()\R*[^\R]*(\R*\))/${1}\n    '"$plugins"'\n${2}/gms' $HOME/.zshrc

unset plugins

set_zsh_default_shell() {
    printf "\ndefault shell is \033[32m$SHELL\033[0m\n"
    if [[ $SHELL =~ zsh ]]; then
        return
    fi
    echo "Try Changing defalt shell to zsh..."

    if which chsh ``>/dev/null 2>&1; then
        chsh -s /bin/zsh
        return
    fi

    if [ ! -f "/etc/passwd" ]; then
        mkpasswd > /etc/passwd
    fi
}

set_zsh_default_shell

echo 'Done.'
echo '****************************************************************'

