(set vim.g.mapleader ",")
(local keyset vim.keymap.set)

; Move to the next buffer
(keyset :n :<leader>l #(vim.cmd :bnext)) ;{:silent true})
; Move to the previous buffer
(keyset :n :<leader>k #(vim.cmd :bprevious)) ;{:silent true})

; Toggle between buffers
(keyset :n :<leader>bb #(vim.cmd "b #")) ;{:silent true})
(keyset :n :<space>bb #(vim.cmd "b #")) ;{:silent true})
; Remap alternate file
(keyset :n :<M--> :<C-^>) ;{:silent true})

; Close the current buffer and move to the previous one, kind of like a tab
(fn close-buffer []
  (vim.cmd :bp)
  (vim.cmd "bd #"))

(keyset :n :<leader>bq close-buffer) ;{:silent true})
(keyset :n :<space>bq close-buffer) ;{:silent true})
; Force close of current buffer
(keyset :n :<leader>bk #(vim.cmd { :cmd "bd" :bang true})) ;{:silent true})
(keyset :n :<space>bk #(vim.cmd { :cmd "bd" :bang true})) ;{:silent true})

; Make adjusing split sizes a bit more friendly
(keyset :n :<C-w><Left> #(vim.cmd {:cmd "resize" :args ["+3"] :mods { :vertical true}})) ;{:silent true})
(keyset :n :<C-w><Right> #(vim.cmd "vertical resize -3")) ;{:silent true})
(keyset :n :<C-w><Up> #(vim.cmd {:cmd "resize" :args ["+3"]})) ;{:silent true})
(keyset :n :<C-w><Down> #(vim.cmd "resize -3")) ;{:silent true})

; Quicky resize the current split to full screen
(keyset [:n :v] :<Leader>- :<C-w>_)
(keyset [:n :v] :<Leader>< :<C-w>\|)
(keyset [:n :v] :<Leader>0 :<C-w>=)

; (keyset [:n :v] :- :<Nop>) ; should be set by file explorer
(keyset [:n :v] :Q :<Nop>)

; inoremap <C-Space> <C-x><C-o>
; inoremap <C-@> <C-Space>
(keyset :i :<C-Space> :<C-x><C-o>)
(keyset :i "<C-@>" :<C-Space>)

(keyset [:n :v] :<leader><space> #(vim.cmd "nohl"))
; Search and replace on current word
; nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
; nnoremap <Leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>
;; TODO: Not working, pattern not found
(keyset :n :<Leader>s #(vim.cmd "%s/\\<<C-r><C-w>\\>/"))
(keyset :n :<Leader>S #(vim.cmd "%s/\\<<C-r><C-w>\\>//g<Left><Left>"))

; Reselect pasted text
(keyset :n :gp "`[v`]")

;; Primeagen TOP 5 maps ;;
; Behave VIM: makes Y behave like D and C
(keyset :n "Y" "y$")
; Keeping cursor centered on search next work and concat lines
(keyset :n :n "nzzzv")
(keyset :n "N" "Nzzzv")
(keyset :n "J" "mzJ`z")
(keyset :n "<M-C-j>" (fn [] (vim.cmd "cnext") (vim.api.nvim_feedkeys "zzzv" :n false)))
(keyset :n "<M-C-k>" (fn [] (vim.cmd "cprevious") (vim.api.nvim_feedkeys "zzzv" :n false)))
; Add more undo break points
(keyset :i "," ",<c-g>u")
(keyset :i "." ".<c-g>u")
(keyset :i "!" "!<c-g>u")
(keyset :i "?" "?<c-g>u")
(keyset :i "_" "_<c-g>u")
; Move lines
(keyset :v "J" #(vim.api.nvim_feedkeys ":m '>+1<CR>gv=gv<CR>" :n false))
(keyset :v "K" #(vim.api.nvim_feedkeys ":m '<-2<CR>gv=gv<CR>" :n false))
; Stopped using this ones for insert mode
; (keyset :i "<M-j>" #(vim.api.nvim_feedkeys "<esc>:m .+1<CR>==<CR>" :n false))
; (keyset :i "<M-k>" #(vim.api.nvim_feedkeys "<esc>:m .-2<CR>==<CR>" :n false))
; nnoremap <leader>j :m .+1<CR>==
; nnoremap <leader>k :m .-1<CR>==
;; End of Primeagen TOP 5 maps ;;

; copy to clipboard
(keyset [:n :v] :<leader>y "\"+y")
(keyset [:n :v] :<leader>Y  "\"+Y" { :remap true})
(keyset [:n :v] :<leader>p  "\"+p")
(keyset [:n :v] :<leader>P  "\"+P" { :remap true})

; From prime. Paste above selected text without replacing buffer
; xnoremap <leader>p "_dP

; highlight the current line
; nnoremap <silent> <Space>ah :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
; clear all the highlighted lines
; nnoremap <silent> -h :call clearmatches()<CR>
; nmap <Space>yfp :let @" = expand("%")<cr>


(keyset :n :<space>qlo #(vim.cmd "lopen") {:desc "[L]ocation list [o]pen)"})
(keyset :n :<space>qlc #(vim.cmd "lclose") {:desc "[L]ocation list [c]lose"})
(keyset :n :<space>qo  #(vim.cmd "copen") {:desc "[Q]uickfix list [o]pen"})
(keyset :n :<space>qc  #(vim.cmd "cclose") {:desc "[Q]uickfix list [c]lose"})

(keyset :n :<leader>x #(vim.cmd "!chmod +x %") {:silent true})
(keyset :n :<space>oc "i<C-r>=" {:desc "[O]pen [c]alculator"})
(keyset :n :<space>wz (fn [] (vim.cmd "resize +80") (vim.cmd "vertical resize +80")) {:desc "[W]indow [z]oom"})
(keyset :n :<leader>jq #(vim.cmd "%!jq") {:desc "Apply [jq] command to format buffer"})

{}
