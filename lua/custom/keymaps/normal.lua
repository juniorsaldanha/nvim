return {
  [";"] = { ":", "enter command mode", opts = { nowait = true } },
  ["q"] = { "<cmd>quit<cr>", "Quit", opts = { nowait = true } },
  ["<S-h>"] = { "^", "Go to first non-whitespace in the line", opts = { nowait = true } },
  ["<S-l>"] = { "g_", "Go to last non-whitespace in the line", opts = { nowait = true } },
}
