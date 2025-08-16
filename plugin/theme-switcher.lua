-- [nfnl] plugin/theme-switcher.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local available_themes = {"tokyonight", "tokyonight-day", "codescope", "nord"}
local function select_theme()
  local function _2_(choice)
    if choice then
      local lualine = require("lualine")
      vim.cmd.colorscheme(choice)
      lualine.setup({options = {theme = choice}})
      return vim.notify(("Selected theme: " .. choice))
    else
      return nil
    end
  end
  return vim.ui.select(available_themes, {prompt = "Select  Theme:"}, _2_)
end
return keyset("n", "<space>st", select_theme, {desc = "[S]witch [t]heme"})
