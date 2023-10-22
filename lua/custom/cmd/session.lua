local persistence = require "persistence"

M = {}

M.loadDirSession = function()
  local last_session = persistence.load()
  if last_session then
    vim.cmd("source " .. last_session)
  end
end

M.loadLastSession = function()
  local last_session = persistence.load { last = true }
  if last_session then
    vim.cmd("source " .. last_session)
  end
end

M.dontSaveSession = function()
  persistence.stop()
end

return M
