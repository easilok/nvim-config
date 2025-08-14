-- [nfnl] after/plugin/trouble.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local trouble = require("trouble")
trouble.setup({})
local function trouble_toggle_mode(mode)
  local function _2_()
    return trouble.toogle(mode)
  end
  return _2_
end
keyset("n", "<space>xx", trouble.toggle, {desc = "Toggle Trouble List"})
keyset("n", "<space>xw", trouble_toggle_mode("workspace_diagnostics"), {desc = "Toggle Trouble Project Diagnostics"})
keyset("n", "<space>xd", trouble_toggle_mode("document_diagnostics"), {desc = "Toggle Trouble Local Diagnostics"})
keyset("n", "<space>xq", trouble_toggle_mode("quickfix"), {desc = "Toggle Trouble Quickfix List"})
keyset("n", "<space>xl", trouble_toggle_mode("loclist"), {desc = "Toggle Trouble Location List"})
keyset("n", "<space>xr", trouble_toggle_mode("lsp_references"), {desc = "Toggle Trouble References"})
return {}
