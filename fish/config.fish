set fish_key_bindings fish_vim_key_bindings
set fish_bind_mode insert

alias vim nvim
alias timeout gtimeout

set EDITOR nvim

switch (uname)
  case Linux
    set -U fish_user_paths /home/jonny/bin /usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl ~/.cargo/bin/ $fish_user_paths
  case Darwin
    set -U fish_user_paths /usr/local/opt/llvm/bin /opt/local/bin $fish_user_paths
end
