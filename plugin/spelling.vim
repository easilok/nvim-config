" Change spelling errors color
let s:spellhienabled = 0
function! ToggleSpellHi()
  if s:spellhienabled
    highlight SpellBad cterm=underline guifg=None guibg=None
    let s:spellhienabled = 0
  else
    highlight SpellBad cterm=underline guifg=black guibg=red
    let s:spellhienabled = 1
  endif
endfunction
command ToggleSpellHi :call ToggleSpellHi()
map <space>sh :call ToggleSpellHi()<CR> "[S]pell [H]ighlight toggle"

