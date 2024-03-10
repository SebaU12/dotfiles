local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  --ColorScheme
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require 'plugins.colorscheme'
    end
  },

  --NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    keys = { {"<leader>e", ":NvimTreeToggle<CR>", desc="Tree"} },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'plugins.nvim-tree'
    end
  },

  --Telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = { {"<leader>ff", ":Telescope find_files<CR>", desc="Telescope"} },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require 'plugins.telescope'
    end
  },

  --Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'plugins.lualine'
    end
  },

  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter-textobjects" },
    config = function()
      require 'plugins.treesitter'
    end
  }, 
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({})-- mode = 'topline' })
    end
  },

  --Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require 'plugins.mason-config.mason'
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require 'plugins.mason-config.mason_lsp'
    end
  },

  --LSP
  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },
    config = function()
      require 'plugins.lsp-config.lsp-saga'
    end
  },
  {
    "onsails/lspkind.nvim",
    config = function()
      require 'plugins.lsp-config.lspkind'
    end
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require 'plugins.lsp-config.nvim-cmp'
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require 'plugins.lsp-config.language-server'
    end
  },

  --AutoPairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require 'plugins.autopairs'
    end
  },
  'windwp/nvim-ts-autotag',
  
  --Mostrar colores 
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require 'plugins.colorizer'
    end
  },
})
