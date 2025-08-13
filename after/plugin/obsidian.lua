-- [nfnl] after/plugin/obsidian.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local obsidian = require("obsidian")
local base_dir = "~/Nextcloud/Obsidian"
if not (vim.fn.isdirectory(vim.fn.expand(base_dir)) == 0) then
  local function _2_()
    return obsidian.util.toggle_checkbox()
  end
  obsidian.setup({workspaces = {{name = "work", path = (base_dir .. "/Work")}, {name = "personal", path = (base_dir .. "/Personal")}, {name = "knowledge", path = (base_dir .. "/Knowledge"), overrides = {templates = {folder = "99 - templates", date_format = "%Y-%m-%d", time_format = "%H:%M"}}}}, daily_notes = {folder = "journal", date_format = "%Y-%m-%d", default_tags = {"journal"}, template = nil}, templates = {folder = "templates", date_format = "%Y-%m-%d", time_format = "%H:%M"}, preferred_link_style = "markdown", disable_frontmatter = true, mappings = {["<space>ch"] = {action = _2_, opts = {buffer = true}}}})
  local function _3_()
    return vim.cmd("ObsidianWorkspace")
  end
  keyset("n", "<space>ow", _3_, {desc = "Switch [O]bsidian [W]orkspace"})
  local function _4_()
    return vim.cmd("ObsidianQuickSwitch")
  end
  keyset("n", "<space>oq", _4_, {desc = "Switch [O]bsidian [Q]uick Switch"})
  local function _5_()
    return vim.cmd("ObsidianSearch")
  end
  return keyset("n", "<space>og", _5_, {desc = "Switch [O]bsidian Search"})
else
  return nil
end
