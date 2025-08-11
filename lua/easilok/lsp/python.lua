-- [nfnl] fnl/easilok/lsp/python.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local function disable_lsp_watcher()
  local ok, wf = pcall(require, "vim.lsp._watchfiles")
  if ok then
    local function _2_()
      return nil
    end
    wf._watchfunc = _2_
    return nil
  else
    return nil
  end
end
local function _4_(_, _0)
  local function _5_()
    return vim.cmd("Neoformat ruff")
  end
  keyset("n", "-f", _5_, {desc = "[F]ormat buffer"})
  return disable_lsp_watcher()
end
vim.lsp.config.pyright = {on_attach = _4_, filetypes = {"python"}}
return vim.lsp.enable("pyright")
