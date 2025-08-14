" Change motion keys to work with line wrapper
let b:wrapenabled = 0
let b:defaulttw = 0
function! ToggleWrap()
    if !exists("b:wrapenabled")
        let b:wrapenabled = 0
    endif
    if !exists("b:defaulttw")
        let b:defaulttw = 0
    endif
    if b:wrapenabled
        set nowrap list
        set nolinebreak
        unmap j
        unmap k
        unmap 0
        unmap ^
        unmap $
        let b:wrapenabled = 0
        " Restore previous 'textwidth'
        exe 'set textwidth=' . b:defaulttw
    else
        set wrap nolist
        set linebreak
        nnoremap j gj
        nnoremap k gk
        nnoremap 0 g0
        nnoremap ^ g^
        nnoremap $ g$
        vnoremap j gj
        vnoremap k gk
        vnoremap 0 g0
        vnoremap ^ g^
        vnoremap $ g$
        let b:wrapenabled = 1
        " Saving previous 'textwidth' in case of wrap reversion
        let b:defaulttw=&textwidth
        set textwidth=0
    endif
endfunction
map <leader>wl :call ToggleWrap()<CR>
command ToggleWrap :call ToggleWrap()


