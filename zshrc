
export EDITOR=vim

# Antigen Configuration
source dotfiles/antigen/antigen.zsh

antigen bundle --loc=lib

antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


antigen apply
