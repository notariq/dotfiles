set number              " Enable line numbers
set relativenumber      " Enable relative line numbers
set tabstop=4           " Number of spaces for a tab
set shiftwidth=4        " Spaces for each auto-indent
set expandtab           " Use spaces instead of tabs
let mapleader = " "     " Set leader key

lua << EOF
require('packer').startup(function()
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Example plugins
  use 'nvim-treesitter/nvim-treesitter'  -- Better syntax highlighting
  use 'nvim-lua/plenary.nvim'           -- Lua utility functions
  use 'nvim-telescope/telescope.nvim'   -- Fuzzy finder
  use 'neovim/nvim-lspconfig'           -- LSP configurations
  use 'hrsh7th/nvim-cmp'                -- Autocompletion plugin
  use 'L3MON4D3/LuaSnip'                -- Snippet engine
end)
EOF

