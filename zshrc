# Antigen Configuration
source dotfiles/antigen/antigen.zsh

# Use oh-my-zsh
antigen use oh-my-zsh

# Plugins
antigen bundle git
antigen bundle wd 
antigen bundle screen 
antigen bundle vi-mode 
antigen bundle history-substring-search 
antigen bundle web-search 
antigen bundle sharat87/autoenv
antigen bundle hchbaw/opp.zsh

# Theme
antigen theme pygmalion

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


if [[ $CURRENT_OS == 'OS X' ]]; then
  antigen bundle osx
  antigen bundle macports
elif [[ $CURRENT_OS == 'Linux' ]]; then
  antigen bundle chucknorris
  antigen bundle archlinux 
  antigen bundle systemd 
  export PATH="/home/jonny/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
fi

antigen apply

source dotfiles/zshcustom/vim.zsh

# My Editor
export EDITOR=vim
