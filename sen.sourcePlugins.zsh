##
# This file just describe the imperfect in the custom.zsh
#
#    **plugins cannot been setting in custom.zsh**
#
#    example:
#
#    When set plugins in custom.zsh file:
#
#    ##########file:custom.zsh########
#    plugins=(git z vi-mode)
#    #################################
#
#    It won't work, the BETTER way is modify it in .zshrc
#
#    This is caused by custom.zsh is sourced after plugins were
#    sourced in [oh-my-zsh.sh] (version 5.1.1)
#
#    That's not that convinient for but there is no better way.
#
#    If I try to source the plugins again in this file
#    There are two disadvantage:
#    1. It may caused the shell slower when start, the custom.zsh files
#       should also been sourced again.
#    2. If this file sourced first then the custom-plugin-setting.zsh
#       It won't work. And this is more complicated when try to control it.
##


