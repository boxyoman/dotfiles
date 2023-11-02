local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorfully stuff
  use 'bling/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nanotech/jellybeans.vim'
  use 'NLKNguyen/papercolor-theme'
  use 'nathanaelkane/vim-indent-guides'

  -- Languages and stuff
  use 'dag/vim-fish'
  use 'LnL7/vim-nix'
  use 'neovimhaskell/haskell-vim'
  use 'ionide/Ionide-vim'
  use {
    'MrcJkb/haskell-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    },
    branch = '1.x.x',
  }
  use 'purescript-contrib/purescript-vim'
  use 'vmchale/dhall-vim'
  use 'ziglang/zig.vim'

  -- File finding and stuff
  use { 'scrooloose/nerdtree', cmd = 'NERDTreeToggle' }
  use {
    'ThePrimeagen/harpoon',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- use 'junegunn/fzf'
  -- use 'junegunn/fzf.vim'

  -- Git stuff
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- Stuff
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use {'simnalamburt/vim-mundo', cmd = 'MundoToggle'}
  use 'bkad/CamelCaseMotion'
  use 'b4winckler/vim-angry'
  use 'justinmk/vim-sneak'
  use 'mhinz/vim-grepper'
  use 'tpope/vim-commentary'
  use 'machakann/vim-highlightedyank'

  -- Completion and stuff
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-cmdline',  'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

