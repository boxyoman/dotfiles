
export EDITOR=vim
export PATH="/home/jonny/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

# Antigen Configuration
source dotfiles/antigen/antigen.zsh

antigen bundle --loc=lib

# Plugins
antigen bundle git
antigen bundle systemd 
antigen bundle wd 
antigen bundle archlinux 
antigen bundle screen 
antigen bundle vi-mode 
antigen bundle history-substring-search 
antigen bundle web-search 
antigen bundle chucknorris
antigen bundle sharat87/autoenv
antigen bundle hchbaw/opp.zsh

# Theme
antigen theme pygmalion

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


antigen apply

source dotfiles/zshcustom/vim.zsh
