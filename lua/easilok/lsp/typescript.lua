-- [nfnl] fnl/easilok/lsp/typescript.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local function _2_(_, _0)
  local function _3_()
    return vim.cmd("Neoformat prettier")
  end
  return keyset("n", "-f", _3_, {desc = "[F]ormat buffer"})
end
vim.lsp.config.ts_ls = {cmd = {"vtsls", "--stdio"}, on_attach = _2_}
return vim.lsp.enable("ts_ls")
