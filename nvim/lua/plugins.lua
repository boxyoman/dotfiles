return {
  'folke/lazy.nvim',
  -- Colorfully stuff
  'bling/vim-airline',
  'vim-airline/vim-airline-themes',
  'nanotech/jellybeans.vim',
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "AlexvZyl/nordic.nvim",
  'nvim-treesitter/nvim-treesitter',
  "lukas-reineke/indent-blankline.nvim",


  -- Languages and stuff
  'dag/vim-fish',
  'LnL7/vim-nix',
  'neovimhaskell/haskell-vim',
  'ionide/Ionide-vim',
  'neovim/nvim-lspconfig',
  {
    'MrcJkb/haskell-tools.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
  },
  'purescript-contrib/purescript-vim',
  'vmchale/dhall-vim',
  'ziglang/zig.vim',

  -- File finding and stuff
  'scrooloose/nerdtree',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },

  -- Git stuff
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',

  -- Stuff
  'simnalamburt/vim-mundo',
  'bkad/CamelCaseMotion',
  'tpope/vim-surround',
  'b4winckler/vim-angry',
  'tpope/vim-repeat',

  -- Completion and stuff
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-cmdline',  'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
    },
  },

  {
    "jellydn/hurl.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
    opts = {
      -- Show debugging info
      debug = false,
      -- Show notification on run
      show_notification = false,
      -- Show response in popup or split
      mode = "split",
      auto_close = false,
      -- Default formatter
      formatters = {
        json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
      },
      -- Default mappings for the response popup or split views
      mappings = {
        close = 'q', -- Close the response popup or split view
        next_panel = '<C-n>', -- Move to the next response popup window
        prev_panel = '<C-p>', -- Move to the previous response popup window
      },
    },
    keys = {
      -- Run API request
      { "<leader>hA", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
      { "<leader>ha", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
      { "<leader>htm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
      { "<leader>htv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
      { "<leader>htV", "<cmd>HurlVeryVerbose<CR>", desc = "Run Api in very verbose mode" },
      -- Run Hurl request in visual mode
      { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
    },
  },
  'elkowar/yuck.vim',


}
