#!/bin/bash

# ********************************************************************
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# ********************************************************************
# check install
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
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
echo 'install start...'

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

echo ' + [config]: sen.zshenv.zsh...'
cp $INSTALLER_DIR/sen.zshenv.zsh $ZSH_CUSTOM

echo ' + [config]: sen.zshrc.zsh...'
cp $INSTALLER_DIR/sen.zshrc.zsh $ZSH_CUSTOM

echo ' + [config]: sen.func.zsh...'
cp $INSTALLER_DIR/sen.func.zsh $ZSH_CUSTOM

echo ' + [config]: tldr.complete.zsh...'
cp $INSTALLER_DIR/tldr.complete.zsh $ZSH_CUSTOM

## install theme
echo ' + [theme]: sen.zsh-theme...'
if [ ! -d $ZSH_CUSTOM/themes ]; then
    mkdir $ZSH_CUSTOM/themes
fi

cp $INSTALLER_DIR/sen_cyg.zsh-theme $ZSH_CUSTOM/themes

# set plugins
## remove comments of leading '#'
_plugins=$(sed '/^#.*/d' $INSTALLER_DIR/plugins.conf)
## combine multilines into single line
plugins=$(echo $_plugins | perl -pe 's/\n//g') && unset _plugins

echo "set plugins from [plugins.conf]"
echo "plugins=("
echo "    $plugins"
echo ")"
perl -i -0pe 's/(^\s*plugins\s*=\s*\()\R*[^\R]*(\R*\))/${1}\n    '"$plugins"'\n${2}/gms' $HOME/.zshrc

unset plugins

set_zsh_default_shell() {
    echo "default shell is $SHELL"
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

    #TODO 修改/etc/passwd
}

set_zsh_default_shell

# ********************************************************************
echo 'done.'

