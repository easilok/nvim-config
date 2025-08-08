-- [nfnl] after/plugin/fugitive.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local function _2_()
  return vim.cmd("Gvdiff")
end
keyset("n", "<leader>gd", _2_)
local function _3_()
  return vim.cmd("diffget //2")
end
keyset("n", "gdh", _3_)
local function _4_()
  return vim.cmd("diffget //3")
end
keyset("n", "gdl", _4_)
local function fugitive_and_run(cmd)
  vim.cmd("Git")
  if cmd then
    return vim.cmd(cmd)
  else
    return nil
  end
end
local function _6_()
  return vim.cmd("Git")
end
keyset("n", "<leader>gg", _6_)
local function _7_()
  return fugitive_and_run("Git fetch --all")
end
keyset("n", "<leader>gf", _7_)
local function _8_()
  return vim.cmd("Git push")
end
keyset("n", "<leader>gp", _8_)
local function _9_()
  return vim.cmd("Git")
end
keyset("n", "<space>gg", _9_)
local function _10_()
  return fugitive_and_run("Git fetch --all")
end
keyset("n", "<space>gf", _10_)
local function _11_()
  return vim.cmd("Git push")
end
keyset("n", "<space>gp", _11_)
local function _12_()
  return vim.cmd("Git log -50 --oneline")
end
keyset("n", "gh", _12_, {desc = "[G]it Log [H]istory"})
local function _13_()
  return vim.cmd("Git")
end
keyset("n", "g<cr>", _13_, {desc = "[G]it"})
local function _14_()
  return vim.cmd("Git blame")
end
return keyset("n", "gb", _14_, {desc = "[G]it [B]lame"})
