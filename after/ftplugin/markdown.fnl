(local {: keyset} (require :easilok.utils))

(set vim.opt_local.spell true)
(set vim.opt_local.tw 120)

; syntax match mdUnckeck "\v- \[ \].*$"
; syntax match mdCheck "\v- \[x\].*$"
; syntax match mdTodo "\vTODO:"
; syntax match mdDone "\vDONE:"

; highlight mdTodo guifg=#00ff00
; highlight mdUncheck guifg=#00ff00
; highlight mdCheck guifg=#4c4c4c
; highlight mdDone guifg=#4c4c4c
; highlight link mdDone Comment

(keyset :n :<leader>mt #(vim.cmd "RenderMarkdownToggle"))
(set vim.opt_local.conceallevel 2)

