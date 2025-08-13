-- [nfnl] fnl/easilok/settings.fnl
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmenu = true
vim.o.swapfile = false
vim.o.backup = false
vim.g.netrw_altfile = 1
if vim.fn.has("persistent_undo") then
  vim.o.undodir = vim.fn.expand("~/.cache/undodir")
  vim.o.undofile = true
else
end
vim.o.exrc = true
vim.o.secure = true
vim.g.finder_plugin = "telescope"
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.foldlevel = 200
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
return {}
