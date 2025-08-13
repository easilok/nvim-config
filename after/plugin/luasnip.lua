-- [nfnl] after/plugin/luasnip.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local ls = require("luasnip")
local types = require("luasnip.util.types")
ls.config.set_config({enable_autosnippets = true, ext_opts = {[types.choiceNode] = {active = {virt_text = {{" \194\171 ", "NonTest"}}}}}, updateevents = "TextChanged,TextChangedI", history = false})
require("luasnip.loaders.from_vscode").lazy_load()
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("snipets/ft/*.lua", true)) do
  local snippet = loadfile(ft_path)
  snippet()
end
local function _2_()
  if ls.expand_or_jumpable() then
    return ls.expand_or_jump()
  else
    return nil
  end
end
keyset({"i", "s"}, "<C-k>", _2_, {desc = "Jump forward or expand Snippet"})
local function _4_()
  if ls.jumpable(( - 1)) then
    return ls.jump(( - 1))
  else
    return nil
  end
end
keyset({"i", "s"}, "<C-j>", _4_, {desc = "Jump backwards Snipped"})
local function _6_()
  if ls.choice_active() then
    return ls.change_choice(1)
  else
    return nil
  end
end
keyset("i", "<C-l>", _6_, {desc = "Select Snippet choice"})
local function _8_()
  return loadfile(vim.fn.expand("~/.config/nvim/after/plugin/luasnip.lua"))
end
return keyset("n", "<leader><leader>s", _8_, {desc = "Reload Snippet configuration"})
