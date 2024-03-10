require("nvim-treesitter.configs").setup({
  ensure_installed = { 
    "bash", "css", "dockerfile", "fish", "gitcommit", "gitignore", 
    "html", "javascript", "json", "json5", "jsonc", "lua", "markdown", 
    "markdown_inline", "python", "toml", "typescript", "vim", "vimdoc", 
    "yaml", "cpp"
  },
  sync_install = false,
  autotag = {
    enable = true,
  },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
    disable = {"ruby"}
  },

  -- From the nvim-treesitter/nvim-treesitter-textobjects plugin
  textobjects = {
    -- can also swap parameters
    select = {
      enable = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a function" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = { query = "@function.outer", desc = "Next function start" },
        ["]c"] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_previous_start = {
        ["[f"] = { query = "@function.outer", desc = "Next function end" },
        ["[c"] = { query = "@class.outer", desc = "Next class end" },
      }
    }
  }
})

