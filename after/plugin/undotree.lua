-- [nfnl] after/plugin/undotree.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
vim.g.undotree_SetFocusWhenToggle = 1
local function _2_()
  return vim.cmd("UndotreeToggle")
end
return keyset("n", "<leader>u", _2_)
