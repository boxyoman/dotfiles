### OS Detection
UNAME=`uname`

# Fallback info
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
  CURRENT_OS='OS X'
else
  # Must be Linux, determine distro
  if [[ -f /etc/redhat-release ]]; then
    # CentOS or Redhat?
    if grep -q "CentOS" /etc/redhat-release; then
      DISTRO='CentOS'
    else
      DISTRO='RHEL'
    fi
  fi
fi

# Antigen Configuration
source ~/dotfiles/antigen/antigen.zsh

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

# OS specific stuff
if [[ $CURRENT_OS == 'OS X' ]]; then
  antigen bundle osx
  antigen bundle macports
  antigen bundle brew
  export PATH="/opt/local/bin":$PATH
  # My Mac Editor
  export EDITOR=nvim
  alias vim=nvim
elif [[ $CURRENT_OS == 'Linux' ]]; then
  antigen bundle chucknorris
  antigen bundle archlinux 
  antigen bundle systemd 
  export PATH="/home/jonny/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
  # My Linux Editor
  # I want to make it neovim in the future
  export EDITOR=vim
fi

antigen apply

source ~/dotfiles/zshcustom/vim.zsh

