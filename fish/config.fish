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
  case Darwin
    set -U fish_user_paths  /usr/local/bin ~/.cargo/bin/ ~/.local/bin/ /Library/Frameworks/Mono.framework/Commands
    set -U ANDROID_SDK_ROOT /usr/local/share/android-sdk
    bass . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
end
