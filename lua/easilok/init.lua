-- [nfnl] fnl/easilok/init.fnl
local function setup()
  require("easilok.plugins")
  require("easilok.settings")
  require("easilok.ui")
  require("easilok.keybindings")
  return require("easilok.lsp")
end
return {setup = setup}
