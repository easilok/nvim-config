(local {: keyset} (require :easilok.utils))
(local lspconfig (require :lspconfig))
(local lsp-defaults lspconfig.util.default_config)
(local default-capabilities (. (require "cmp_nvim_lsp") :default_capabilities))

(set lsp-defaults.capabilities (vim.tbl_deep_extend "force"
                                                    lsp-defaults.capabilities
                                                    (default-capabilities)))


(vim.diagnostic.config {:virtual_text false
                        :signs true
                        :underline true
                        :update_in_insert false})


(keyset :n :gd vim.lsp.buf.definition { :desc "Lsp Jumps to [D]efinition"})
(keyset :n :gr vim.lsp.buf.references { :desc "Lsp List [R]references to symbol"})

;; Show line diagnostics
(keyset :n :<space>sl vim.diagnostic.open_float { :desc "L[s]p [L]ine diagnostics"})

;; Diagnostic jump
;;  You can use <C-o> to jump back to your previous location
(keyset :n "[e" #(vim.diagnostic.goto_prev {:count 1 :float true}) { :desc "Lsp Diagnostic previous"})
(keyset :n "]e" #(vim.diagnostic.goto_prev {:count -1 :float true}) { :desc "Lsp Diagnostic next"})

;; Gitting Diagnostic Help
(keyset :n "-k" vim.lsp.buf.hover { :desc "Lsp hover doc"})
(keyset :n :<space>sh vim.lsp.buf.signature_help { :desc "Lsp [S]ignature [H]elp"})


;! LSP functional
(keyset :n "-d" vim.lsp.buf.definition)
(keyset :n :<space>lwd vim.lsp.buf.references)
(keyset :n "-D" vim.lsp.buf.declaration)
(keyset :n "-r" vim.lsp.buf.references)
(keyset :n :<space>lwr vim.lsp.buf.references)
(keyset :n "-i" vim.lsp.buf.implementation)
(keyset :n :K vim.lsp.buf.hover)
(keyset :n :<space>lk vim.lsp.buf.hover)
(keyset :i :<C-h> vim.lsp.buf.signature_help)
(keyset :n "]d" #(vim.diagnostic.goto_prev {:count -1 :float true}))
(keyset :n "[d" #(vim.diagnostic.goto_prev {:count 1 :float true}))
(keyset :n :<space>D vim.lsp.buf.type_definition)
(keyset :n :<space>rn vim.lsp.buf.rename)
(keyset :n :<space>la vim.lsp.buf.code_action)
(keyset :n :<space>e vim.diagnostic.open_float)
(keyset :n "-f" #(vim.lsp.buf.format {:async true}))
(keyset :n :<space>lws vim.lsp.buf.workspace_symbol)

(each [_ language (ipairs ["fennel" "nix" "typescript" "python"])]
  (require (.. "easilok.lsp." language)))

{}
