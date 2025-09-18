-- [nfnl] after/plugin/buffer_manager.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local buffer_manager = require("buffer_manager")
buffer_manager.setup({show_indicators = "before", width = 0.9, height = 0.5})
keyset("n", "<C-e>", require("buffer_manager.ui").toggle_quick_menu, {desc = "Buffer List Manager"})
return {}
