-- [nfnl] fnl/easilok/utils.fnl
local function keyset(mode, keymap, mapping, opts)
  local opts0 = (opts or {})
  if not opts0.silent then
    opts0.silent = true
  else
  end
  return vim.keymap.set(mode, keymap, mapping, opts0)
end
return {keyset = keyset}
