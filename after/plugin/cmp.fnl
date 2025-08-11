(local cmp (require :cmp))
(local lspkind (require :lspkind))

(local source-mapping { :buffer "[Buffer]"
                        :nvim_lsp "[LSP]"
                        :nvim_lua "[Lua]"
                        :path "[Path]"
                        :luasnip "[LuaSnip]"
                        :tags "[tags]"
                        :conjure "[conj]"
                        :codecompanion "[companion]"})



(cmp.setup { :snippet { :expand (fn [args]
                                    (let [ luasnip (require :luasnip)]
                                        (luasnip.lsp_expand (. args :body))))} 
            :window {:documentation (cmp.config.window.bordered)}
            :formatting
            {:format (lspkind.cmp_format {  :mode "symbol"
                                            :maxwidth 50
                                            :ellipsis_char "..."
                                            :before (fn [entry vim_item]
                                                        (let [name entry.source.name]
                                                            (set vim_item.menu  (. source-mapping name))
                                                            vim_item))})}
            :mapping (cmp.mapping.preset.insert {   :<C-u> (cmp.mapping.scroll_docs -4)
                                                    :<C-d> (cmp.mapping.scroll_docs 4)
                                                    :<C-Space> (cmp.mapping.complete)
                                                    :<C-e> (cmp.mapping.abort)
                                                    :<CR> (cmp.mapping.confirm { :select false})})
            :sources (cmp.config.sources [  {   :name "luasnip"}
                                            {   :name "nvim_lsp"}
                                            {   :name "tags"
                                                :option {   :complete_defer 100
                                                            :max_items 10
                                                            :keyword_length 3
                                                            :exact_match false
                                                            :current_buffer_only false}}
                                            { :name "conjure"}
                                            { :name "codecompanion"}]
                                         [  { :name "buffer"}])})


;; Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
(cmp.setup.cmdline [ "/" "?"]
                   { :mapping (cmp.mapping.preset.cmdline)
                     :sources [ { :name "buffer"}]})

;; Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
(cmp.setup.cmdline ":"
                   { :mapping (cmp.mapping.preset.cmdline)
                     :sources (cmp.config.sources [ { :name "path"}]
                                                  [ { :name "cmdline"}])})

;; Setup vim-dadbod
(cmp.setup.filetype [ "sql" "mysql" "plsql"]
                    { :sources [ { :name "vim-dadbod-completion"} 
                                 { :name "sources"}]})
