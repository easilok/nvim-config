(local {: keyset} (require :easilok.utils))

(fn disable-lsp-watcher []
    (let [( ok wf ) (pcall require :vim.lsp._watchfiles)]
        (when ok
            ;; disable lsp watcher. Too slow on linux
            (set wf._watchfunc (fn [] nil)))))

(set vim.lsp.config.pyright {:on_attach (fn [_ _]
                                            (keyset :n "-f" #(vim.cmd "Neoformat ruff") { :desc "[F]ormat buffer"})
                                            (disable-lsp-watcher))
                             :filetypes ["python"]})

(vim.lsp.enable "pyright")
