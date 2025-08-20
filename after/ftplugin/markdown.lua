-- [nfnl] after/ftplugin/markdown.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
vim.opt_local.spell = true
vim.opt_local.tw = 120
local function _2_()
  return vim.cmd("RenderMarkdownToggle")
end
keyset("n", "<leader>mt", _2_)
vim.opt_local.conceallevel = 2
return nil
