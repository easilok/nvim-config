(local {: keyset} (require :easilok.utils))
(local harpoon (require :harpoon))

(harpoon:setup)

(keyset :n :<leader>aa (fn [] (: (harpoon:list) :add)) {:desc "H[a]rpoon [A]dd"})
(keyset :n :<leader>tq (fn [] (harpoon.ui:toggle_quick_menu (harpoon:list)))
                {:desc "[T]oggle Harpoon [Q]uick Menu"})
(keyset :n :<space>ha (fn [] (: (harpoon:list) :add))
                {:desc "[H]arpoon [A]dd"})
(keyset :n :<space>hm
                (fn [] (harpoon.ui:toggle_quick_menu (harpoon:list)))
                {:desc "[H]arpoon toggle [M]enu"})
(keyset :n :<M-h> (fn [] (: (harpoon:list) :select 1))
                {:desc "Harpoon select 1"})
(keyset :n :<M-j> (fn [] (: (harpoon:list) :select 2))
                {:desc "Harpoon select 2"})
(keyset :n :<M-k> (fn [] (: (harpoon:list) :select 3))
                {:desc "Harpoon select 3"})
(keyset :n :<M-l> (fn [] (: (harpoon:list) :select 4))
                {:desc "Harpoon select 4"})
(keyset :n :<C-S-P> (fn [] (: (harpoon:list) :prev))
                {:desc "Harpoon select previous"})
(keyset :n :<C-S-N> (fn [] (: (harpoon:list) :next))
                {:desc "Harpoon select next"})

(fn toggle-telescope [harpoon-files]
  (let [file-paths {}]
    (each [_ item (ipairs harpoon-files.items)]
      (table.insert file-paths item.value))
    (let [  pickers (require :telescope.pickers)
            finders (require :telescope.finders)
            telescope-conf (. (require :telescope.config) "values")
            picker (pickers.new {}
                                { :prompt_title "Harpoon"
                                 :finder (finders.new_table {:results file-paths})
                                 :previewer (telescope-conf.file_previewer {})
                                 :sorter (telescope-conf.generic_sorter {})})]
       (picker:find))))

(keyset :n :<leader>ga (fn [] (toggle-telescope (harpoon:list)))
                {:desc "Telescope [g]rep h[a]rpoon"})
(keyset :n :<space>ht (fn [] (toggle-telescope (harpoon:list)))
                {:desc "[H]arpoon [T]elescope grep"})  
