(require :easilok.theme)

;; Line numbers
(set vim.o.number true)
(set vim.o.relativenumber true)
(set vim.o.cursorline true) ; hightligh current line
(set vim.o.modelines 1) ; TODO: default is 5. Do I need this?

;; Show whitespaces with different characthers
(set vim.o.list true)
(set vim.o.listchars "trail:-,tab:>>")
;; Keeps this minimum of lines above and below the cursor.
(set vim.o.scrolloff 8)

(set vim.o.colorcolumn "120")

; For italics on tmux
; (set vim.o.t_ZH "^[[3m]]")
; (set vim.o.t_ZR "^[[23m]]")

;; Use 256 colours (Use this setting only if your terminal supports 256 colours)
; (set vim.o.t_Co 256)
; if has('termguicolors')
;   set termguicolors
; endif

(set vim.wo.signcolumn :yes)

{}
