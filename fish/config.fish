set -g fish_key_bindings fish_vim_key_bindings
set fish_bind_mode insert

alias vim nvim
alias timeout gtimeout

setenv EDITOR nvim
eval (direnv hook fish)

setenv FZF_DEFAULT_COMMAND "rg --files"

switch (uname)
  case Darwin
    set PATH /usr/local/bin ~/.cargo/bin/ ~/.local/bin/ ~/.cabal/bin/ /run/current-system/sw/bin /nix/var/nix/profiles/default/bin /usr/bin /bin /usr/sbin /sbin /Users/Jonny/.nix-profile/bin
    # set -U fish_user_paths ~/.cargo/bin/ ~/.local/bin/ ~/.cabal/bin/
    # source /etc/fish/config.fish
end
