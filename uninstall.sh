#!/bin/bash


if [ ! -n "$ZSH_CUSTOM" ]; then
  ZSH_CUSTOM=~/.oh-my-zsh/custom
fi

if [ ! -d "$ZSH_CUSTOM" ]; then
  printf "The folder ${YELLOW}[ZSH_CUSTOM]${NORMAL} does no exist.\n"
  printf "ZSH_CUSTOM : $ZSH_CUSTOM .\n"
  exit
fi

echo '****************************************************************'
echo 'uninstall start...'

echo ' - [plugin]'
rm -rf $ZSH_CUSTOM/plugins/*

remove_config() {
    echo " - [config]: $1"
    rm -rf $ZSH_CUSTOM/$1
}

remove_config env.zsh
remove_config config.zsh
remove_config functions.zsh
remove_config tldr.complete.zsh
remove_config sen.zsh

echo 'Done.'
echo '****************************************************************'
