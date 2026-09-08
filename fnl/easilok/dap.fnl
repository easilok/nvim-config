(local {: keyset} (require :easilok.utils))

(local dap (require :dap))
(local dap-virtual-text (require :nvim-dap-virtual-text))
(local dapui (require :dapui))

(dap.set_log_level :INFO)

(fn dap-terminate-and-close []
  (dap.terminate) (dapui.close))

(dap-virtual-text.setup {})
(dapui.setup)

(keyset :n :<F5> dap.continue {:desc "Dap Continue"})
(keyset :n :<F3> dap.step_over {:desc "Dap Step Over"})
(keyset :n :<F2> dap.step_into {:desc "Dap Step Into"})
(keyset :n :<F4> dap.step_out {:desc "Dap Step Out"})
(keyset :n :<space>db dap.toggle_breakpoint
                {:desc "[D]ap toggle [b]reakpoint"})
(keyset :n :<space>dB
                (fn []
                    (dap.set_breakpoint (vim.fn.input "Breakpoint condition: ")))
                {:desc "[D]ap [B]reakpoint condition"})
(keyset :n :<space>dp
                (fn []
                    (dap.set_breakpoint nil nil
                                            (vim.fn.input "Log point message: ")))
                {:desc "[D]ap set break[p]oint"})
(keyset :n :<space>dr dap.repl.open {:desc "[D]ap [R]epl"})
(keyset :n :<space>dx dap-terminate-and-close {:desc "[D]apui Close"})
(keyset :n :<space>dt dap-terminate-and-close
                {:desc "[D]apui [T]erminate"})

(set dap.listeners.after.event_initialized.dapui_config 
     (fn [] (dapui.open)))

(local adapters (. dap :adapters))

(when (not (. adapters :pwa-node))
    (tset adapters :pwa-node { :type "server"
                                  :host "localhost"
                                  :port "${port}"
                                  :executable { :command "node"
                                                :args [ (vim.fn.expand "~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js")
                                                        "${port}"]}}))
(when (not (. adapters :node))
  (tset apaters :node (fn dap.adapters.node [cb config]
                              (when (= config.type :node) (set config.type :pwa-node))
                              (let [native-adapter (. dap.adapters :pwa-node)]
                                (if (= (type native-adapter) :function)
                                    (native-adapter cb config)
                                    (cb native-adapter))))))

(fn find-python-interpreter []
  (let [venv (os.getenv "VIRTUAL_ENV")]
    (if venv
        (.. venv "/bin/python")
        "python")))
  
(when (not (. adapters :python))
    (let [python (find-python-interpreter)]
        (tset adapters :python { :type "executable"
                                 :command python
                                 :args [ "-m" "debugpy.adapter"]})))

{: dap : find-python-interpreter}
