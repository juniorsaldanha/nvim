local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "go",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python",
    -- }
  },
}

M.mason = {
  ensure_installed = {
    -- General purpose
    "prettier",
    "prettierd",
    "codespell",

    -- Lua
    "lua-language-server",
    "stylua",

    -- Go
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "gomodifytags",
    "golines",
    "impl",
    "iferr",

    -- Python
    "pyright",

    -- C/C++
    "clangd",
    "cpplint",
  },
}

return M
