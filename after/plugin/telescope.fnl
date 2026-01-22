(local {: keyset} (require :easilok.utils))

(local finder-plugin (or vim.g.finder-plugin "telescope"))
(local telescope (require :telescope))
(local action_layout (require :telescope.actions.layout))
(local builtin (require :telescope.builtin))
(local actions (require :telescope.actions))
(local action_state (require :telescope.actions.state))
  
(telescope.setup {  :defaults {  :prompt_prefix " >"
                                 :color_devicons true
                                 :border true
                                 :sorting_strategy "ascending"
                                 :layout_strategy "bottom_pane"
                                 :layout_config
                                 { :width 0.5
                                   :prompt_position "top"
                                   :vertical {:prompt_position "bottom"}}
                                 :mappings
                                 { :i 
                                   { "<C-t>" action_layout.cycle_layout_next}
                                   :n
                                   { "<C-t>" action_layout.cycle_layout_next}}}})

(telescope.load_extension "fzf")

(fn keyset-leader-space [mode map action opts]
  (keyset mode (.. "<leader>" map) action opts)
  (keyset mode (.. "<space>" map) action opts))

(when (= finder-plugin "telescope")
    ;; Set new commands to better name
    (vim.api.nvim_create_user_command "GoToFile" builtin.find_files {:nargs 0 :desc "Open file picker"})
    (vim.api.nvim_create_user_command "GoToCommand" builtin.commands {:nargs 0 :desc "Open commands picker"})

    (keyset :n :<space><space> builtin.git_files { :desc "[F]ind [g]it files"})
    (keyset :n :<C-p> builtin.find_files {:desc "[F]ind [f]iles"})

    (keyset :n :<leader>gb builtin.git_branches { :desc "[G]it [b]ranches"})
    (keyset :n :<leader>gc builtin.git_commits { :desc "[G]it [c]ommits"})
    (keyset :n :<leader>cr builtin.lsp_references { :desc "[C]ode [r]eferences"})
    (keyset :n :<space>hc builtin.help_tags { :desc "[T]elescope [h]elp files"})
    (keyset :n :<space>ce builtin.diagnostics { :desc "[C]ode diagnostics [e]rrors"})
    (keyset :n :<space>cds builtin.lsp_document_symbols { :desc " [C]ode [D]ocument [S]ymbols"})
    (keyset :n :<space>cws builtin.lsp_dynamic_workspace_symbols { :desc "[C]ode [W]orkspace [S]ymbols"})
    (keyset :n :<space>ft builtin.tags { :desc "[F]ind [T]ags"})
    (keyset :n :<space>hr builtin.resume { :desc "[H]elp [r]esume"})
    (keyset :n :<space>hk builtin.keymaps { :desc "[H]help [k]eymaps"})

    (keyset-leader-space :n :? builtin.oldfiles { :desc "[?] Find recently opened files"})
    (keyset-leader-space :n :fg builtin.git_files { :desc "[F]ind [g]it files"})
    (keyset-leader-space :n :ff builtin.find_files { :desc "[F]ind [f]iles"})
    (keyset-leader-space :n :sp (fn [] (builtin.grep_string { :search (vim.fn.input "Grep For > ")}) { :desc "[G]rep [s]earch"}))
    (keyset-leader-space :n :sw (fn [] (builtin.grep_string { :search (vim.fn.expand "<cword>") }) { :desc "[G]rep current [w]ord"}))
    (keyset-leader-space :n :bl builtin.buffers { :desc "[B]uffer [l]ist"})
    (keyset-leader-space :n :sl builtin.live_grep { :desc "[G]rep [l]ive"})
    (keyset-leader-space :n :fb (fn [] (builtin.current_buffer_fuzzy_find { :sorting_strategy "ascending" }) { :desc "[F]ind [b]uffer text"}))
    (keyset-leader-space :n :be (fn [] (builtin.diagnostics { :bufnr 0 }) { :desc "[B]uffer diagnostics"}))


    (fn grep_visual_selection []
        (vim.cmd "noau normal! \"vy\"")
        (let [text (vim.fn.getreg :v)]
            (vim.fn.setreg :v {})
            (builtin.grep_string {:search (string.gsub text "\n" "")})))

    (keyset-leader-space :v :sv grep_visual_selection { :desc "[G]rep visual [s]earch"}))
