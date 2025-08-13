;; (set vim.o.filetype :off)                 ; required

;; Whitespace and identation
(set vim.o.wrap false) ; don't wrap lines
(set vim.o.tabstop 4) ; defines visual length of tabs in spaces
(set vim.o.shiftwidth 4)  ; defines visual length of tabs in spaces
(set vim.o.softtabstop 4) ; number of spaces in tab when editing
(set vim.o.shiftround true) ; rounds indent to multiples of shiftwidth
(set vim.o.expandtab true) ; use spaces, not tabs

;; Searching
(set vim.o.hlsearch true) ; highlight search matches
(set vim.o.incsearch true) ; incremental searching
(set vim.o.ignorecase true) ; searches are case insensitive...
(set vim.o.smartcase true) ; ... unless they contain at least one capital letter
(set vim.o.wildmenu true) ; visual autocomplete for command menu

;; Disable recovery files
(set vim.o.swapfile false)
(set vim.o.backup false)

;; Enables return to previous file with alternate file keybinding
(set vim.g.netrw_altfile 1)

;! enable permanent undotree
(when (vim.fn.has "persistent_undo")
    (set vim.o.undodir (vim.fn.expand "~/.cache/undodir"))
    (set vim.o.undofile true))

;; For per folder vim-settings
(set vim.o.exrc true)
(set vim.o.secure true)

;; let g:finder_plugin = 'fzflua'
(set vim.g.finder_plugin "telescope")

(set vim.o.splitbelow true)
(set vim.o.splitright true)

(set vim.opt.completeopt ["menu" "menuone" "noselect"])

;; folding

(set vim.opt.foldlevel 200)
(set vim.opt.foldmethod "expr")
(set vim.opt.foldexpr "nvim_treesitter#foldexpr()")
(set vim.opt.foldexpr "v:lua.vim.treesitter.foldexpr()")

{}
