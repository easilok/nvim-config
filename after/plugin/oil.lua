-- [nfnl] after/plugin/oil.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local force_netrw = os.getenv("FORCE_NETRW")
if not force_netrw then
  local oil = require("oil")
  oil.setup({keymaps = {["<BS>"] = "actions.parent", ["<M-s>"] = "actions.select_split", ["<M-v>"] = "actions.select_vsplit", ["<C-h>"] = false}})
  keyset("", "<F7>", oil.open, {desc = "Open Oil file browser"})
  keyset("", "<M-p>", oil.open, {desc = "Open Oil file browser"})
  return keyset("n", "-", oil.open, {desc = "Open Oil file browser"})
else
  local function _2_()
    return vim.cmd("Explore")
  end
  keyset("", "<F7>", _2_, {desc = "Open Netrw file browser"})
  local function _3_()
    return vim.cmd("Explore")
  end
  return keyset("n", "-", _3_, {desc = "Open Netrw file browser"})
end
