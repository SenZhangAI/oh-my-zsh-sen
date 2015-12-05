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

if [ ! -d "$ZSH" ]; then
  printf "You may not install ${YELLOW}[Oh-My-Zsh]${NORMAL}.\n"
  printf "You need to install it first.\n"
  exit
fi


# ********************************************************************
# install start
echo 'install start...'

if [ ! -d $ZSH/custom/plugins/zsh-syntax-highlighting ]; then
  echo '+ install zsh-syntax-highlighting'
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi

echo ' + install sen.zshenv.zsh...'
cp $(PWD)/sen.zshenv.zsh $ZSH/custom/

#echo ' + install sen.zshrc.zsh...'
#cp $(PWD)/sen.zshrc.zsh $ZSH/custom/

## install theme
echo ' + install sen.zsh-theme...'
if [ ! -d $ZSH/custom/themes ]; then
  mkdir $ZSH/custom/themes
fi

cp $(PWD)/sen_cyg.zsh-theme $ZSH/custom/themes
echo 'done.'
