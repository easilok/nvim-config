-- [nfnl] fnl/easilok/keybindings.fnl
vim.g.mapleader = ","
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local function _2_()
  return vim.cmd("bnext")
end
keyset("n", "<leader>l", _2_)
local function _3_()
  return vim.cmd("bprevious")
end
keyset("n", "<leader>k", _3_)
local function _4_()
  return vim.cmd("b #")
end
keyset("n", "<leader>bb", _4_)
local function _5_()
  return vim.cmd("b #")
end
keyset("n", "<space>bb", _5_)
keyset("n", "<M-->", "<C-^>")
local function close_buffer()
  vim.cmd("bp")
  return vim.cmd("bd #")
end
keyset("n", "<leader>bq", close_buffer)
keyset("n", "<space>bq", close_buffer)
local function _6_()
  return vim.cmd({cmd = "bd", bang = true})
end
keyset("n", "<leader>bk", _6_)
local function _7_()
  return vim.cmd({cmd = "bd", bang = true})
end
keyset("n", "<space>bk", _7_)
local function _8_()
  return vim.cmd({cmd = "resize", args = {"+3"}, mods = {vertical = true}})
end
keyset("n", "<C-w><Left>", _8_)
local function _9_()
  return vim.cmd("vertical resize -3")
end
keyset("n", "<C-w><Right>", _9_)
local function _10_()
  return vim.cmd({cmd = "resize", args = {"+3"}})
end
keyset("n", "<C-w><Up>", _10_)
local function _11_()
  return vim.cmd("resize -3")
end
keyset("n", "<C-w><Down>", _11_)
keyset({"n", "v"}, "<Leader>-", "<C-w>_")
keyset({"n", "v"}, "<Leader><", "<C-w>\\|")
keyset({"n", "v"}, "<Leader>0", "<C-w>=")
keyset({"n", "v"}, "Q", "<Nop>")
keyset("i", "<C-Space>", "<C-x><C-o>")
keyset("i", "<C-@>", "<C-Space>")
local function _12_()
  return vim.cmd("nohl")
end
keyset({"n", "v"}, "<leader><space>", _12_)
keyset("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/")
keyset("n", "<Leader>S", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")
keyset("n", "gp", "`[v`]")
keyset("n", "Y", "y$")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")
keyset("n", "J", "mzJ`z")
local function _13_()
  vim.cmd("cnext")
  return vim.api.nvim_feedkeys("zzzv", "n", false)
end
keyset("n", "<M-C-j>", _13_)
local function _14_()
  vim.cmd("cprevious")
  return vim.api.nvim_feedkeys("zzzv", "n", false)
end
keyset("n", "<M-C-k>", _14_)
keyset("i", ",", ",<c-g>u")
keyset("i", ".", ".<c-g>u")
keyset("i", "!", "!<c-g>u")
keyset("i", "?", "?<c-g>u")
keyset("i", "_", "_<c-g>u")
local function _15_()
  return vim.api.nvim_feedkeys(":m '>+1<CR>gv=gv<CR>", "n", false)
end
keyset("v", "J", _15_)
local function _16_()
  return vim.api.nvim_feedkeys(":m '<-2<CR>gv=gv<CR>", "n", false)
end
keyset("v", "K", _16_)
keyset({"n", "v"}, "<leader>y", "\"+y")
keyset({"n", "v"}, "<leader>Y", "\"+Y", {remap = true})
keyset({"n", "v"}, "<leader>p", "\"+p")
keyset({"n", "v"}, "<leader>P", "\"+P", {remap = true})
local function _17_()
  return vim.cmd("lopen")
end
keyset("n", "<space>qlo", _17_, {desc = "[L]ocation list [o]pen)"})
local function _18_()
  return vim.cmd("lclose")
end
keyset("n", "<space>qlc", _18_, {desc = "[L]ocation list [c]lose"})
local function _19_()
  return vim.cmd("copen")
end
keyset("n", "<space>qo", _19_, {desc = "[Q]uickfix list [o]pen"})
local function _20_()
  return vim.cmd("cclose")
end
keyset("n", "<space>qc", _20_, {desc = "[Q]uickfix list [c]lose"})
local function _21_()
  return vim.cmd("!chmod +x %")
end
keyset("n", "<leader>x", _21_, {silent = true})
keyset("n", "<space>oc", "i<C-r>=", {desc = "[O]pen [c]alculator"})
local function _22_()
  vim.cmd("resize +80")
  return vim.cmd("vertical resize +80")
end
keyset("n", "<space>wz", _22_, {desc = "[W]indow [z]oom"})
local function _23_()
  return vim.cmd("%!jq")
end
keyset("n", "<leader>jq", _23_, {desc = "Apply [jq] command to format buffer"})
return {}
