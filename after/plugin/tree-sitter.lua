-- [nfnl] after/plugin/tree-sitter.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_.keyset
local treesitter = require("nvim-treesitter")
local context = require("treesitter-context")
local language_parsers = {"bash", "c", "commonlisp", "cpp", "css", "dockerfile", "fennel", "go", "gomod", "html", "javascript", "jsdoc", "json", "json5", "latex", "lua", "make", "markdown", "markdown_inline", "nix", "php", "python", "rasi", "regex", "rust", "scheme", "scss", "toml", "tsx", "typescript", "vim", "vimdoc", "vue", "yaml"}
treesitter.install(language_parsers)
context.setup({enable = true, throttle = true, max_lines = 3, trim_scope = "outer", patterns = {default = {"class", "function", "method"}, typescript = {"class_declaration", "abstract_class_declaration"}}, zindex = 20, mode = "cursor", separator = "-"})
local function _2_()
  return vim.cmd("TSContextToggle")
end
return keyset("n", "<leader>ct", _2_)
