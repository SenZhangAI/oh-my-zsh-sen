#!/bin/bash
echo 'install start...'

if [ ! -d $ZSH/custom/plugins/zsh-syntax-highlighting ]; then
  echo '+ install zsh-syntax-highlighting'
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi

echo ' + install sen.zshenv.zsh...'
cp $(PWD)/sen.zshenv.zsh $ZSH/custom/
#echo ' + install sen.zshrc.zsh...'
#cp $(PWD)/sen.zshrc.zsh $ZSH/custom/
echo ' + install sen.zsh-theme...'
cp $(PWD)/sen_cyg.zsh-theme $ZSH/themes/
echo 'done.'
