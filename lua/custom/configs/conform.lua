local formatter = require "conform"

formatter.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    go = { "goimports-reviser", "gofumpt" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    json = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    ["*"] = { "codespell" },
  },
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
  format_on_save = function(bufnr)
    if vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then
      return
    end
    return {
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
}

vim.api.nvim_create_user_command("AutoFormatToggle", function(args)
  if args.bang then
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    vim.notify(
      "Autoformat " .. (vim.b.disable_autoformat and "disabled" or "enabled") .. " for this buffer",
      vim.log.levels.INFO,
      { title = "Conform" }
    )
  else
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    vim.notify(
      "Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled") .. " globally",
      vim.log.levels.INFO,
      { title = "Conform" }
    )
  end
end, {
  desc = "Toggle autoformat-on-save",
  bang = true,
})
