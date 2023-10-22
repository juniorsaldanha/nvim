local present, nvterm = pcall(require, "nvterm")
if not present then
  print "‼ Tried loading nvterm ... unsuccessfully."
  return
end

nvterm.setup {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.7,
        border = "single",
      },
    },
  },
}
