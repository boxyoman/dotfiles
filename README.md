Dotfiles
========

This is a repo for my dotfiles.

Submodules
==========

I have two submodules. One for antigen and one for my vim configuration.  I'll 
eventually merge my vim repo with this repo. Make sure to initialize them with

  git submodule update --init --recursive

Install
=======

To install symlink the appropriate files and folders to your home directory. 
These include:
  * dotvim        -> ~/.vim
  * zshrc         -> ~/.zshrc
  * ~/.vim/vimrc  -> ~/.vimrc

I might create a script to do this later.

Some of the vim plugins have some components that need installed too.
