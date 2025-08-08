(fn keyset [mode keymap mapping opts]
   (let [opts (or opts {})]
     (when (not (. opts :silent))
       (set opts.silent true))
    (vim.keymap.set mode keymap mapping opts)))

{: keyset}

