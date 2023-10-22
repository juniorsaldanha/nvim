local present, persistence = pcall(require, "persistence")
if not present then
  print("Error on loading persistence")
  return
end

persistence.setup {
  dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
  options = { "buffers", "curdir", "tabpages", "winsize" },
}
