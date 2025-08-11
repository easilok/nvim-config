-- [nfnl] fnl/easilok/lsp.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
local default_capabilities = require("cmp_nvim_lsp").default_capabilities
lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, default_capabilities())
vim.diagnostic.config({signs = true, underline = true, update_in_insert = false, virtual_text = false})
keyset("n", "gd", vim.lsp.buf.definition, {desc = "Lsp Jumps to [D]efinition"})
keyset("n", "gr", vim.lsp.buf.references, {desc = "Lsp List [R]references to symbol"})
keyset("n", "<space>sl", vim.diagnostic.open_float, {desc = "L[s]p [L]ine diagnostics"})
local function _2_()
  return vim.diagnostic.goto_prev({count = 1, float = true})
end
keyset("n", "[e", _2_, {desc = "Lsp Diagnostic previous"})
local function _3_()
  return vim.diagnostic.goto_prev({count = -1, float = true})
end
keyset("n", "]e", _3_, {desc = "Lsp Diagnostic next"})
keyset("n", "-k", vim.lsp.buf.hover, {desc = "Lsp hover doc"})
keyset("n", "<space>sh", vim.lsp.buf.signature_help, {desc = "Lsp [S]ignature [H]elp"})
keyset("n", "-d", vim.lsp.buf.definition)
keyset("n", "<space>lwd", vim.lsp.buf.references)
keyset("n", "-D", vim.lsp.buf.declaration)
keyset("n", "-r", vim.lsp.buf.references)
keyset("n", "<space>lwr", vim.lsp.buf.references)
keyset("n", "-i", vim.lsp.buf.implementation)
keyset("n", "K", vim.lsp.buf.hover)
keyset("n", "<space>lk", vim.lsp.buf.hover)
keyset("i", "<C-h>", vim.lsp.buf.signature_help)
local function _4_()
  return vim.diagnostic.goto_prev({count = -1, float = true})
end
keyset("n", "]d", _4_)
local function _5_()
  return vim.diagnostic.goto_prev({count = 1, float = true})
end
keyset("n", "[d", _5_)
keyset("n", "<space>D", vim.lsp.buf.type_definition)
keyset("n", "<space>rn", vim.lsp.buf.rename)
keyset("n", "<space>la", vim.lsp.buf.code_action)
keyset("n", "<space>e", vim.diagnostic.open_float)
local function _6_()
  return vim.lsp.buf.format({async = true})
end
keyset("n", "-f", _6_)
keyset("n", "<space>lws", vim.lsp.buf.workspace_symbol)
for _, language in ipairs({"fennel", "nix", "typescript", "python"}) do
  require(("easilok.lsp." .. language))
end
return {}
