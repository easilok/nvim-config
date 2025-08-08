(local {: keyset} (require :easilok.utils))
(local force_netrw (os.getenv "FORCE_NETRW"))

(if (not force_netrw)
    (let [oil (require "oil")]
      (oil.setup {:keymaps { "<BS>" "actions.parent"
                             "<C-h>"   false
                             "<M-s>"   "actions.select_split"
                             "<M-v>"   "actions.select_vsplit"}})
     (keyset "" "<F7>" oil.open { :desc "Open Oil file browser"})
     (keyset "" "<M-p>" oil.open { :desc "Open Oil file browser"})
     (keyset :n "-" oil.open { :desc "Open Oil file browser"}))
    (do
      (keyset "" "<F7>" #(vim.cmd "Explore") { :desc "Open Netrw file browser"})
      (keyset :n "-" #(vim.cmd "Explore") { :desc "Open Netrw file browser"})))
