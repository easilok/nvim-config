(local {: keyset} (require :easilok.utils))
(local trouble (require :trouble))

(trouble.setup {})

(fn trouble-toggle-mode [mode]
  (fn []
    (trouble.toogle mode)))

(keyset :n :<space>xx trouble.toggle {:desc "Toggle Trouble List"})
(keyset :n :<space>xw (trouble-toggle-mode "workspace_diagnostics") {:desc "Toggle Trouble Project Diagnostics"})
(keyset :n :<space>xd (trouble-toggle-mode "document_diagnostics") {:desc "Toggle Trouble Local Diagnostics"})
(keyset :n :<space>xq (trouble-toggle-mode "quickfix") {:desc "Toggle Trouble Quickfix List"})
(keyset :n :<space>xl (trouble-toggle-mode "loclist") {:desc "Toggle Trouble Location List"})
(keyset :n :<space>xr (trouble-toggle-mode "lsp_references") {:desc "Toggle Trouble References"})

{}
