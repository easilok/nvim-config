-- [nfnl] after/ftplugin/markdown.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
vim.opt.spell = true
vim.opt.tw = 120
local function _2_()
  return vim.cmd("RenderMarkdownToggle")
end
keyset("n", "<leader>mt", _2_)
vim.opt.conceallevel = 2
return nil
