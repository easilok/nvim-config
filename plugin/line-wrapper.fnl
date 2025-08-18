; (tset vim.b :wrapenable 0)
; (tset vim.b :defaulttw 0)

(fn toggle-wrap []
  (when (= vim.b.wrapenable nil)
    (set vim.b.wrapenable false))
  (when (= vim.b.defaulttw nil)
    (set vim.b.defaulttw (: vim.opt_local.textwidth :get)))
         
  (if vim.b.wrapenabled
      (do
        (set vim.opt_local.wrap false)
        (set vim.opt_local.list true)
        (set vim.opt_local.linebreak false)
        (vim.keymap.del [:n :v] :j {:buffer true})
        (vim.keymap.del [:n :v] :k {:buffer true})
        (vim.keymap.del [:n :v] :0 {:buffer true})
        (vim.keymap.del [:n :v] "^" {:buffer true})
        (vim.keymap.del [:n :v] "$" {:buffer true})
        (set vim.b.wrapenabled false)
        ; Restore previous 'textwidth'
        (set vim.opt_local.textwidth vim.b.defaulttw))
      (do
        (set vim.opt_local.wrap true)
        (set vim.opt_local.list false)
        (set vim.opt_local.linebreak true)
        (vim.keymap.set [:n :v] :j :gj {:buffer true})
        (vim.keymap.set [:n :v]:k :gk {:buffer true})
        (vim.keymap.set [:n :v]:0 :g0 {:buffer true})
        (vim.keymap.set [:n :v]:^ :g^ {:buffer true})
        (vim.keymap.set [:n :v]:$ :g$ {:buffer true})
        (set vim.b.wrapenabled true)
        ; Saving previous 'textwidth' in case of wrap reversion
        (set vim.b.defaulttw (: vim.opt_local.textwidth :get))
        (set vim.opt_local.textwidth 0))))

(vim.keymap.set :n :<leader>wl toggle-wrap)
(vim.api.nvim_create_user_command "ToggleWrap" (fn [] (toggle-wrap)) {})
