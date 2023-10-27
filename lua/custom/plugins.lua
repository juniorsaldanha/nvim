local overrides = require "custom.configs.overrides"

local plugins = {
  -- Disable plugin
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- Override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "3.*",
        config = function()
          require "custom.configs.window-picker"
        end,
      },
    },
    config = function()
      require "custom.configs.neo-tree"
    end,
  },

  {
    "NvChad/nvterm",
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function()
      require "base46.term"
      require "custom.configs.nvterm"
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function()
      local opts = require "custom.keymaps.which-key"
      return opts
    end,
  },

  -- Add new plugins
  -- TODO: Add some plugins
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      require "custom.configs.git-blame"
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "custom.configs.todo-comments"
    end,
  },

  {
    "psliwka/vim-smoothie",
    event = "BufReadPre",
    config = function()
      require "custom.configs.vim-smoothie"
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require "custom.configs.persistence"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end,
  },

  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    -- NOTE: Load the plugin settings with delay
    config = function()
      -- @diagnostic disable-next-line: param-type-mismatch
      vim.defer_fn(function()
        require "custom.configs.copilot"
        -- @diagnostic disable-next-line: param-type-mismatch
      end, 200)
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "BufReadPre",
  },
}

return plugins
