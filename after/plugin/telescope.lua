-- [nfnl] after/plugin/telescope.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local finder_plugin = (vim.g["finder-plugin"] or "telescope")
local telescope = require("telescope")
local action_layout = require("telescope.actions.layout")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
telescope.setup({defaults = {prompt_prefix = " >", color_devicons = true, border = true, sorting_strategy = "ascending", layout_strategy = "bottom_pane", layout_config = {width = 0.5, prompt_position = "top", vertical = {prompt_position = "bottom"}}, mappings = {i = {["<C-t>"] = action_layout.cycle_layout_next}, n = {["<C-t>"] = action_layout.cycle_layout_next}}}})
telescope.load_extension("fzf")
local function keyset_leader_space(mode, map, action, opts)
  keyset(mode, ("<leader>" .. map), action, opts)
  return keyset(mode, ("<space>" .. map), action, opts)
end
if (finder_plugin == "telescope") then
  vim.api.nvim_create_user_command("GoToFile", builtin.find_files, {nargs = 0, desc = "Open file picker"})
  vim.api.nvim_create_user_command("GoToCommand", builtin.commands, {nargs = 0, desc = "Open commands picker"})
  keyset("n", "<space><space>", builtin.git_files, {desc = "[F]ind [g]it files"})
  keyset("n", "<C-p>", builtin.find_files, {desc = "[F]ind [f]iles"})
  keyset("n", "<leader>gb", builtin.git_branches, {desc = "[G]it [b]ranches"})
  keyset("n", "<leader>gc", builtin.git_commits, {desc = "[G]it [c]ommits"})
  keyset("n", "<leader>fh", builtin.help_tags, {desc = "[F]ind [h]elp files"})
  keyset("n", "<leader>gr", builtin.lsp_references, {desc = "[G]rep [r]eferences"})
  keyset("n", "<space>th", builtin.help_tags, {desc = "[T]elescope [h]elp files"})
  keyset("n", "<space>we", builtin.diagnostics, {desc = "[G]rep diagnostics"})
  keyset("n", "<space>lds", builtin.lsp_document_symbols, {desc = "[L]sp [D]ocument [S]ymbols"})
  keyset("n", "<space>lws", builtin.lsp_dynamic_workspace_symbols, {desc = "[L]sp [W]orkspace [S]ymbols"})
  keyset("n", "<space>ft", builtin.tags, {desc = "[F]ind [T]ags"})
  keyset("n", "<space>tr", builtin.resume, {desc = "[T]elescope [r]esume"})
  keyset("n", "<space>tk", builtin.keymaps, {desc = "[T]elescope [k]eymaps"})
  keyset_leader_space("n", "?", builtin.oldfiles, {desc = "[?] Find recently opened files"})
  keyset_leader_space("n", "fg", builtin.git_files, {desc = "[F]ind [g]it files"})
  keyset_leader_space("n", "ff", builtin.find_files, {desc = "[F]ind [f]iles"})
  local function _2_()
    builtin.grep_string({search = vim.fn.input("Grep For > ")})
    return {desc = "[G]rep [s]earch"}
  end
  keyset_leader_space("n", "gs", _2_)
  local function _3_()
    builtin.grep_string({search = vim.fn.expand("<cword>")})
    return {desc = "[G]rep current [w]ord"}
  end
  keyset_leader_space("n", "gw", _3_)
  keyset_leader_space("n", "bl", builtin.buffers, {desc = "[B]uffer [l]ist"})
  keyset_leader_space("n", "gl", builtin.live_grep, {desc = "[G]rep [l]ive"})
  local function _4_()
    builtin.current_buffer_fuzzy_find({sorting_strategy = "ascending"})
    return {desc = "[F]ind [b]uffer text"}
  end
  keyset_leader_space("n", "fb", _4_)
  local function _5_()
    builtin.diagnostics({bufnr = 0})
    return {desc = "[B]uffer diagnostics"}
  end
  keyset_leader_space("n", "be", _5_)
  local function grep_visual_selection()
    vim.cmd("noau normal! \"vy\"")
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})
    return builtin.grep_string({search = string.gsub(text, "\n", "")})
  end
  return keyset_leader_space("v", "gs", grep_visual_selection, {desc = "[G]rep visual [s]earch"})
else
  return nil
end
