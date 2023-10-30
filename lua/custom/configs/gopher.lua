local gopher = require "gopher"

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests",
    impl = "impl",
    iferr = "iferr",
  },
}
