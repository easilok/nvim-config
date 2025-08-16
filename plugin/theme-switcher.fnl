(local {: keyset} (require :easilok.utils))

(local available-themes ["tokyonight"
                         "tokyonight-day"
                         "codescope"
                         "nord"])

(fn select-theme []
    (vim.ui.select available-themes {:prompt "Select  Theme:"}
                   (fn [choice]
                     (when choice
                        (let [lualine (require :lualine)]
                            (vim.cmd.colorscheme choice)
                            (lualine.setup { :options { :theme choice}})
                            (vim.notify (.. "Selected theme: " choice)))))))

(keyset :n :<space>st select-theme {:desc "[S]witch [t]heme"})  


