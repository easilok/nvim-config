-- [nfnl] after/plugin/markdown.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
vim.g.instant_markdown_autostart = 0
vim.g.instant_markdown_allow_unsafe_content = 1
vim.g.instant_markdown_mathjax = 1
vim.g.instant_markdown_mermaid = 1
vim.g.instant_markdown_theme = "dark"
vim.g.instant_markdown_browser = "firefox --new-window"
local render_markdown = require("render-markdown")
render_markdown.setup({code = {width = "block", right_pad = 1, inline_right = "`", inline_left = "`", sign = false}, heading = {icons = {}, sign = false}, pipe_table = {enabled = false}, checkbox = {enabled = false}})
local function markdown_table_format()
  return vim.cmd("Tabularize\\|")
end
local function _2_(event)
  vim.api.nvim_create_user_command("TabFormat", markdown_table_format, {})
  return keyset({"n", "v"}, "<space>mt", markdown_table_format, {desc = "[M]arkdown [T]able format"})
end
return vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", callback = _2_})
