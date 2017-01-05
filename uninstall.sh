#!/bin/bash


if [ ! -n "$ZSH_CUSTOM" ]; then
  ZSH_CUSTOM=~/.oh-my-zsh/custom
fi

if [ ! -d "$ZSH_CUSTOM" ]; then
  printf "The folder ${YELLOW}[ZSH_CUSTOM]${NORMAL} does no exist.\n"
  printf "ZSH_CUSTOM : $ZSH_CUSTOM .\n"
  exit
fi

echo 'uninstall start...'

echo ' - [plugin]remove: themes'
rm -rf $ZSH_CUSTOM/plugins/themes

echo ' - [config]: sen.zshenv.zsh...'
rm $ZSH_CUSTOM/sen.zshenv.zsh

echo ' - remove sen.zshrc.zsh...'
rm $ZSH_CUSTOM/sen.zshrc.zsh

echo ' - [theme]: sen_cyg.zsh-theme...'
rm $ZSH_CUSTOM/themes/sen_cyg.zsh-theme
echo 'done.'
