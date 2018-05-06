set -g fish_key_bindings fish_vim_key_bindings
set fish_bind_mode insert

alias vim nvim
alias timeout gtimeout

setenv EDITOR nvim

switch (uname)
  case Darwin
    set -U fish_user_paths  /usr/local/bin ~/.cargo/bin/ ~/.local/bin/ /Library/Frameworks/Mono.framework/Commands
    source /etc/fish/config.fish
end
