-- [nfnl] plugin/floaterm.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local state = {floating = {buf = ( - 1), win = ( - 1)}}
local function buffer_3f(buf)
  return (buf and vim.api.nvim_buf_is_valid(buf))
end
local function create_buffer_window(buf, height, width, col, row)
  local buf0
  if buffer_3f(buf) then
    buf0 = buf
  else
    buf0 = vim.api.nvim_create_buf(false, true)
  end
  return {buf = buf0, win = vim.api.nvim_open_win(buf0, true, {border = "rounded", col = col, row = row, height = height, width = width, relative = "editor"})}
end
local function create_floating_window(opts)
  local opts0 = (opts or {})
  local width = (opts0.width or math.floor((vim.o.columns * 0.8)))
  local height = (opts0.height or math.floor((vim.o.lines * 0.8)))
  local col = math.floor(((vim.o.columns - width) / 2))
  local row = math.floor(((vim.o.lines - height) / 2))
  return create_buffer_window(opts0.buf, height, width, col, row)
end
local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({buf = state.floating.buf})
    if not (vim.bo[state.floating.buf].buftype == "terminal") then
      return vim.cmd.terminal()
    else
      return nil
    end
  else
    return vim.api.nvim_win_hide(state.floating.win)
  end
end
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
keyset("n", "<space>tf", toggle_terminal, {desc = "[T]erminal [f]loat"})
return {}
