#!/bin/bash

echo 'uninstall start...'
echo ' - remove sen.zshenv.zsh...'
rm $ZSH/custom/sen.zshenv.zsh
#echo ' - remove sen.zshrc.zsh...'
#rm $ZSH/custom/sen.zshrc.zsh
echo ' - remove sen.zsh-theme...'
rm $ZSH/custom/themes/sen_cyg.zsh-theme
echo 'done.'
