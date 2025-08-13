-- [nfnl] after/plugin/mason-dap.fnl
local mason_dap = require("mason-nvim-dap")
return mason_dap.setup({automatic_installation = true}, "ensure_installed", {"node2", "js", "python"})
