-- [nfnl] fnl/easilok/init.fnl
local function setup()
  require("easilok.plugins")
  require("easilok.settings")
  require("easilok.ui")
  return require("easilok.keybindings")
end
return {setup = setup}
