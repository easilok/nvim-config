-- [nfnl] plugin/easiterm.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_.keyset
local M = {}
local state = {current_command = "", job_id = 0, term_buf = ( - 1)}
M.open_term_split = function(detach)
  local detach0 = (detach or false)
  vim.cmd.vnew()
  if (not detach0 and vim.api.nvim_buf_is_valid(state.term_buf)) then
    vim.api.nvim_set_current_buf(state.term_buf)
  else
    vim.cmd.term()
  end
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 20)
  if not detach0 then
    state.term_buf = vim.api.nvim_get_current_buf()
    state.job_id = vim.bo.channel
    return nil
  else
    return nil
  end
end
vim.api.nvim_create_user_command("Easiterm", M.open_term_split, {})
local function _4_()
  return M.open_term_split(true)
end
vim.api.nvim_create_user_command("EasitermDetach", _4_, {})
local function _5_()
  vim.opt.number = false
  vim.opt.relativenumber = false
  return nil
end
vim.api.nvim_create_autocmd("TermOpen", {callback = _5_, group = vim.api.nvim_create_augroup("custom-term-open", {clear = true})})
keyset("t", "<esc><esc>", "<c-\\><c-n>")
keyset("n", "<space>ot", M.open_term_split, {desc = "[T]erminal toggle on split"})
local function _6_()
  return M.open_term_split(true)
end
return keyset("n", "<space>oT", _6_, {desc = "[T]erminal [o]pen detached on split"})
