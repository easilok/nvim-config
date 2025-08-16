-- [nfnl] fnl/easilok/theme.fnl
local theme = "nord"
local tokyonight_settings
local function _1_(colors)
  colors.border = "#ff9c33"
  return colors
end
tokyonight_settings = {style = "night", transparent = true, terminal_colors = true, styles = {comments = {italic = true}, keywords = {italic = true}, functions = {}, variables = {}, sidebars = "dark", floats = "dark"}, sidebars = {"qf", "help"}, day_brightness = 0.7, dim_inactive = true, on_colors = _1_, hide_inactive_statusline = false, lualine_bold = false}
do
  local codespace = require("codescope")
  codespace.setup({transparent = true})
end
do
  local tokyonight = require("tokyonight")
  tokyonight.setup(tokyonight_settings)
end
vim.cmd.colorscheme(theme)
vim.api.nvim_set_hl(0, "Normal", {ctermbg = "none", bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {ctermbg = "none", bg = "none"})
vim.api.nvim_set_hl(0, "LineNr", {fg = "#ff9c33"})
vim.api.nvim_set_hl(0, "CursorLineNr", {fg = "#ff9c33"})
vim.api.nvim_set_hl(0, "LineNrAbove", {fg = "#9b9b9b"})
vim.api.nvim_set_hl(0, "LineNrBelow", {fg = "#9b9b9b"})
vim.api.nvim_set_hl(0, "LineHighlight", {ctermbg = "darkgray", bg = "darkgray"})
return {theme = theme}
