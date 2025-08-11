(local {: keyset} (require :easilok.utils))

(set vim.lsp.config.ts_ls {:cmd [ "vtsls" "--stdio"]
                           :on_attach (fn [_ _]
                                        (keyset :n "-f" #(vim.cmd "Neoformat prettier") {:desc "[F]ormat buffer"}))})

(vim.lsp.enable "ts_ls")
