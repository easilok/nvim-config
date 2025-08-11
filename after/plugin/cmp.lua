-- [nfnl] after/plugin/cmp.fnl
local cmp = require("cmp")
local lspkind = require("lspkind")
local source_mapping = {buffer = "[Buffer]", nvim_lsp = "[LSP]", nvim_lua = "[Lua]", path = "[Path]", luasnip = "[LuaSnip]", tags = "[tags]", conjure = "[conj]", codecompanion = "[companion]"}
local function _1_(args)
  local luasnip = require("luasnip")
  return luasnip.lsp_expand(args.body)
end
local function _2_(entry, vim_item)
  local name = entry.source.name
  vim_item.menu = source_mapping[name]
  return vim_item
end
cmp.setup({snippet = {expand = _1_}, window = {documentation = cmp.config.window.bordered()}, formatting = {format = lspkind.cmp_format({mode = "symbol", maxwidth = 50, ellipsis_char = "...", before = _2_})}, mapping = cmp.mapping.preset.insert({["<C-u>"] = cmp.mapping.scroll_docs(-4), ["<C-d>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = false})}), sources = cmp.config.sources({{name = "luasnip"}, {name = "nvim_lsp"}, {name = "tags", option = {complete_defer = 100, max_items = 10, keyword_length = 3, current_buffer_only = false, exact_match = false}}, {name = "conjure"}, {name = "codecompanion"}}, {{name = "buffer"}})})
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
return cmp.setup.filetype({"sql", "mysql", "plsql"}, {sources = {{name = "vim-dadbod-completion"}, {name = "sources"}}})
