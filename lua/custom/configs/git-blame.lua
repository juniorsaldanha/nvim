local git_blame = require("gitblame")

git_blame.setup {
  enabled = true,
  message_template = "   <author> • <date> • <summary>",
  message_when_not_committed = "   Oh noes, not committed yet!",
  date_format = "%r",
}
