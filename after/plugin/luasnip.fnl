(local {: keyset} (require :easilok.utils))

;; A lot of this was ported from tjDevries configuration
(local ls (require :luasnip))
(local types (require :luasnip.util.types))

(ls.config.set_config {:enable_autosnippets true
                       ;; Crazy highlights
                       :ext_opts {types.choiceNode {:active {:virt_text [[" « " :NonTest]]}}}
                       :history false
                       ;; Updates dynamic snippets when typing
                       :updateevents "TextChanged,TextChangedI"})

;; Load snippets from VSCode plugins
((. (require :luasnip.loaders.from_vscode) :lazy_load))

;; Load personal script files
(each [_ ft-path
         (ipairs (vim.api.nvim_get_runtime_file "snipets/ft/*.lua" true))]
  (let [snippet (loadfile ft-path)]
    (snippet)))

(keyset [:i :s] :<C-k>
                (fn [] (when (ls.expand_or_jumpable) (ls.expand_or_jump)))
                {:desc "Jump forward or expand Snippet"})
(keyset [:i :s] :<C-j>
                (fn []
                  (when (ls.jumpable (- 1)) (ls.jump (- 1))))
                {:desc "Jump backwards Snipped"})
(keyset :i :<C-l>
                (fn [] (when (ls.choice_active) (ls.change_choice 1)))
                {:desc "Select Snippet choice"})
(keyset :n :<leader><leader>s
                (fn [] (loadfile (vim.fn.expand "~/.config/nvim/after/plugin/luasnip.lua")))
                {:desc "Reload Snippet configuration"})  
