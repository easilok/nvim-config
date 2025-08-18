-- [nfnl] plugin/line-wrapper.fnl
local function toggle_wrap()
  if (vim.b.wrapenable == nil) then
    vim.b.wrapenable = false
  else
  end
  if (vim.b.defaulttw == nil) then
    vim.b.defaulttw = vim.opt_local.textwidth:get()
  else
  end
  if vim.b.wrapenabled then
    vim.opt_local.wrap = false
    vim.opt_local.list = true
    vim.opt_local.linebreak = false
    vim.keymap.del({"n", "v"}, "j", {buffer = true})
    vim.keymap.del({"n", "v"}, "k", {buffer = true})
    vim.keymap.del({"n", "v"}, "0", {buffer = true})
    vim.keymap.del({"n", "v"}, "^", {buffer = true})
    vim.keymap.del({"n", "v"}, "$", {buffer = true})
    vim.b.wrapenabled = false
    vim.opt_local.textwidth = vim.b.defaulttw
    return nil
  else
    vim.opt_local.wrap = true
    vim.opt_local.list = false
    vim.opt_local.linebreak = true
    vim.keymap.set({"n", "v"}, "j", "gj", {buffer = true})
    vim.keymap.set({"n", "v"}, "k", "gk", {buffer = true})
    vim.keymap.set({"n", "v"}, "0", "g0", {buffer = true})
    vim.keymap.set({"n", "v"}, "^", "g^", {buffer = true})
    vim.keymap.set({"n", "v"}, "$", "g$", {buffer = true})
    vim.b.wrapenabled = true
    vim.b.defaulttw = vim.opt_local.textwidth:get()
    vim.opt_local.textwidth = 0
    return nil
  end
end
vim.keymap.set("n", "<leader>wl", toggle_wrap)
local function _4_()
  return toggle_wrap()
end
return vim.api.nvim_create_user_command("ToggleWrap", _4_, {})
