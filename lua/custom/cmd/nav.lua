local picker = require "window-picker"

M = {}

M.pick_window = function()
  local picked_window_id = picker.pick_window()

  if picked_window_id then
    vim.api.nvim_set_current_win(picked_window_id)
  else
    vim.notify("   Something went wrong\nPicked Window Id is `nil`", vim.log.levels.WARN, {
      timeout = 1000,
      render = "minimal",
    })
    return
  end
end

-- Swap two windows using the awesome window picker
M.swap_windows = function()
  local picked_window_id = picker.pick_window {
    include_current_win = false,
  }
  local target_buffer = vim.fn.winbufnr(picked_window_id)
  -- Set the target picked_window_id to contain current buffer
  vim.api.nvim_win_set_buf(picked_window_id, 0)
  -- Set current window to contain target buffer
  vim.api.nvim_win_set_buf(0, target_buffer)
end

return M
