local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.wo.relativenumber = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.o.undofile = true
vim.opt.clipboard = "unnamedplus"
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append "IWs"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
