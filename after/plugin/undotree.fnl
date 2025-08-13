(local {: keyset} (require :easilok.utils))

(set vim.g.undotree_SetFocusWhenToggle 1)

(keyset :n :<leader>u #(vim.cmd "UndotreeToggle"))


