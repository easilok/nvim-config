(local Plug (. vim.fn "plug#"))

(vim.call "plug#begin")

(Plug "tpope/vim-fugitive")
(Plug "tpope/vim-unimpaired") ; Jumping between to conflicts
(Plug "lewis6991/gitsigns.nvim")
(Plug "tpope/vim-dispatch")
(Plug "junegunn/gv.vim")

; Testing out native neovim comment 
; (Plug "tpope/vim-commentary")

(Plug "tpope/vim-repeat")

(Plug "tpope/vim-eunuch") ; SudoEdit and use Shell Commands

(Plug "tpope/vim-abolish")

; (Plug "wellle/targets.vim") ; Adds objects and N objects

(Plug "tpope/vim-surround")

(Plug "tpope/vim-endwise")


;; latex
(Plug "lervag/vimtex")

(Plug "christoomey/vim-tmux-navigator")

(Plug "neovim/nvim-lspconfig")
(Plug "hrsh7th/nvim-cmp")
(Plug "hrsh7th/cmp-nvim-lsp")
(Plug "hrsh7th/cmp-buffer")
(Plug "hrsh7th/cmp-path")
(Plug "hrsh7th/cmp-cmdline")
(Plug "onsails/lspkind.nvim")
(Plug "folke/trouble.nvim")

; (Plug "ray-x/lsp_signature.nvim")
(Plug "j-hui/fidget.nvim")
(Plug "nvim-treesitter/nvim-treesitter" {:do ":TSUpdate"})
(Plug "nvim-treesitter/nvim-treesitter-context")
(Plug "nvim-treesitter/nvim-treesitter-textobjects")
; (Plug "nvim-treesitter/playground")
(Plug "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git")

(Plug "folke/which-key.nvim")
(Plug "lukas-reineke/indent-blankline.nvim")
(Plug "nvim-lua/plenary.nvim")
(Plug "ibhagwan/fzf-lua" {:branch: "main"})
(Plug "nvim-telescope/telescope.nvim")
(Plug "nvim-telescope/telescope-fzf-native.nvim" {:do "make"})
(Plug "ThePrimeagen/harpoon" {:branch "harpoon2"})
(Plug "nvim-lualine/lualine.nvim")
(Plug "kyazdani42/nvim-web-devicons")
(Plug "akinsho/bufferline.nvim" {:tag: "*"})
(Plug "stevearc/oil.nvim")

; debugging
(Plug "mfussenegger/nvim-dap")
(Plug "nvim-neotest/nvim-nio")
(Plug "rcarriga/nvim-dap-ui")
(Plug "theHamsta/nvim-dap-virtual-text")
(Plug "williamboman/mason.nvim")
(Plug "jay-babu/mason-nvim-dap.nvim")

(Plug "folke/todo-comments.nvim")
; TODO: The after update hook is always failing
; (Plug "L3MON4D3/LuaSnip" {:tag "v2.*" :do "make install_jsregexp"})
(Plug "L3MON4D3/LuaSnip" {:tag "v2.*"})
(Plug "rafamadriz/friendly-snippets")
(Plug "saadparwaiz1/cmp_luasnip")

(Plug "folke/tokyonight.nvim" {:branch "main"})
(Plug "srt0/codescope.nvim")

; Prettier
(Plug "sbdchd/neoformat")

; fzf for searching
(Plug "junegunn/fzf" {:dir "~/.fzf" :do "./install --all"})

; Wiki
(Plug "lervag/wiki.vim")
(Plug "lervag/lists.vim")
; Wiki addons
(Plug "itchyny/calendar.vim")
; Obsidian
(Plug "epwalsh/obsidian.nvim")


; Markdown
(Plug "instant-markdown/vim-instant-markdown" {:for ["markdown" "wiki"] :do "npm install"})
(Plug "MeanderingProgrammer/render-markdown.nvim")
(Plug "godlygeek/tabular")

(Plug "mbbill/undotree")

(Plug "notjedi/nvim-rooter.lua") ; always set working dir to project root

; Managing auto session creator
(Plug "tpope/vim-obsession")

; Database interface
(Plug "tpope/vim-dadbod")
(Plug "kristijanhusak/vim-dadbod-ui")
(Plug "kristijanhusak//vim-dadbod-completion" {:for ["sql" "mysql" "plsql"]})

; (Plug "sindrets/diffview.nvim")
(Plug "AndrewRadev/linediff.vim")
(Plug "mechatroner/rainbow_csv")

(Plug "skywind3000/asyncrun.vim")

; Open bif files without crashing neovim
(Plug "LunarVim/bigfile.nvim")

(Plug "folke/zen-mode.nvim")

; Tags
; (Plug "ludovicchabant/vim-gutentags")
; (Plug "quangnguyen30192/cmp-nvim-tags")

; Triage plugins
(Plug "j-morano/buffer_manager.nvim")

; lsp replacement
(Plug "pmizio/typescript-tools.nvim")

; Lisp language REPL
(Plug "Olical/conjure")
(Plug "PaterJason/cmp-conjure")

;; Fennel
(Plug "Olical/nfnl")
(Plug "gpanders/nvim-parinfer")

(vim.call "plug#end")

{}
