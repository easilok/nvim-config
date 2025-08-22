(local {: keyset} (require :easilok.utils))

; Fugitive Conflict Resolution
(keyset :n :<leader>gd #(vim.cmd "Gvdiff"))
(keyset :n :gdh #(vim.cmd "diffget //2"))
(keyset :n :gdl #(vim.cmd "diffget //3"))


(fn fugitive-and-run [cmd]
  "Opens fugitive drawer and executes command"
  (vim.cmd "Git")
  (when cmd (vim.cmd cmd)))

(keyset :n :<leader>gg #(vim.cmd "Git"))
(keyset :n :<leader>gf #(fugitive-and-run "Git fetch --all"))
(keyset :n :<leader>gp #(vim.cmd "Git push"))
(keyset :n :<space>gg #(vim.cmd "Git"))
(keyset :n :<space>gf #(fugitive-and-run "Git fetch --all"))
(keyset :n :<space>gp #(vim.cmd "Git push"))
(keyset :n :<space>gh #(vim.cmd "Git log -50 --oneline") { :desc "[G]it Log [H]istory"})
(keyset :n :<space>fh #(vim.cmd (.. "Git log -50 --oneline --follow -- " (vim.fn.expand "%"))) { :desc "[G]it [L]og file"})
(keyset :n :g<cr> #(vim.cmd "Git") { :desc "[G]it"})
(keyset :n :gb #(vim.cmd "Git blame") { :desc "[G]it [B]lame"})
