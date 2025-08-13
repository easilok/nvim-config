(let [mason-dap (require :mason-nvim-dap)]
    (mason-dap.setup { :automatic_installation true}
                        :ensure_installed ["node2" "js" "python"]))
