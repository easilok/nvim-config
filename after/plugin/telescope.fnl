(local {: keyset} (require :easilok.utils))

(local finder-plugin (or vim.g.finder-plugin "telescope"))
(local telescope (require :telescope))
(local action_layout (require :telescope.actions.layout))
(local builtin (require :telescope.builtin))
(local actions (require :telescope.actions))
(local action_state (require :telescope.actions.state))
  
(telescope.setup {  :defaults {  :prompt_prefix " >"
                                 :color_devicons true
                                 :layout_strategy "vertical"
                                 :layout_config
                                 { :vertical { :width 0.8 :prompt_position "bottom"}}
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
    ; vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])
    ; vim.cmd([[command! -nargs=0 GoToCommand :Telescope commands]])

    (keyset :n :<space><space> builtin.git_files { :desc "[F]ind [g]it files"})
    (keyset :n :<C-p> builtin.find_files {:desc "[F]ind [f]iles"})

    (keyset :n :<leader>gb builtin.git_branches { :desc "[G]it [b]ranches"})
    (keyset :n :<leader>gc builtin.git_commits { :desc "[G]it [c]ommits"})
    (keyset :n :<leader>fh builtin.help_tags { :desc "[F]ind [h]elp files"})
    (keyset :n :<leader>gr builtin.lsp_references { :desc "[G]rep [r]eferences"})
    (keyset :n :<space>th builtin.help_tags { :desc "[T]elescope [h]elp files"})
    (keyset :n :<space>we builtin.diagnostics { :desc "[G]rep diagnostics"})
    (keyset :n :<space>lds builtin.lsp_document_symbols { :desc "[L]sp [D]ocument [S]ymbols"})
    (keyset :n :<space>lws builtin.lsp_dynamic_workspace_symbols { :desc "[L]sp [W]orkspace [S]ymbols"})
    (keyset :n :<space>ft builtin.tags { :desc "[F]ind [T]ags"})
    (keyset :n :<space>tr builtin.resume { :desc "[T]elescope [r]esume"})
    (keyset :n :<space>tk builtin.keymaps { :desc "[T]elescope [k]eymaps"})

    (keyset-leader-space :n :? builtin.oldfiles { :desc "[?] Find recently opened files"})
    (keyset-leader-space :n :fg builtin.git_files { :desc "[F]ind [g]it files"})
    (keyset-leader-space :n :ff builtin.find_files { :desc "[F]ind [f]iles"})
    (keyset-leader-space :n :gs (fn [] (builtin.grep_string { :search (vim.fn.input "Grep For > ")}) { :desc "[G]rep [s]earch"}))
    (keyset-leader-space :n :gw (fn [] (builtin.grep_string { :search (vim.fn.expand "<cword>") }) { :desc "[G]rep current [w]ord"}))
    (keyset-leader-space :n :bl builtin.buffers { :desc "[B]uffer [l]ist"})
    (keyset-leader-space :n :gl builtin.live_grep { :desc "[G]rep [l]ive"})
    (keyset-leader-space :n :fb (fn [] (builtin.current_buffer_fuzzy_find { :sorting_strategy "ascending" }) { :desc "[F]ind [b]uffer text"}))
    (keyset-leader-space :n :be (fn [] (builtin.diagnostics { :bufnr 0 }) { :desc "[B]uffer diagnostics"}))


    (fn grep_visual_selection []
        (vim.cmd "noau normal! \"vy\"")
        (let [text (vim.fn.getreg :v)]
            (vim.fn.setreg :v {})
            (builtin.grep_string {:search (string.gsub text "\n" "")})))

    (keyset-leader-space :v :gs grep_visual_selection { :desc "[G]rep visual [s]earch"}))
