function fish_vim_key_bindings
  fish_vi_key_bindings

  bind -M insert -m default jk backward-char force-repaint
end
