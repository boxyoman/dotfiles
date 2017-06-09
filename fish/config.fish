set -g fish_key_bindings fish_vim_key_bindings
set fish_bind_mode insert

alias vim nvim
alias timeout gtimeout

setenv EDITOR nvim

function add-to-path -d "Add directories to \$PATH"
  for dir in $argv
    if begin
        test -d $dir
        and not contains $dir $PATH
      end
      set -x PATH $dir $PATH
    end
  end
end

switch (uname)
  case Linux
    set -U fish_user_paths /home/jonny/bin /usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl ~/.cargo/bin/ ~/.local/bin/
  case Darwin
    set -U fish_user_paths  /usr/local/bin ~/.cargo/bin/ ~/.local/bin/ /Library/Frameworks/Mono.framework/Commands
    set -U VAGRANT_HOME /Volumes/External/.vagrant.d/
    source /Users/Jonny/dotfiles/fish/nix.fish
end
