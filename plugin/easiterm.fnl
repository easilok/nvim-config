(local {: keyset} (require :easilok.utils))

(local M {})
(local state {  :current_command ""
                :job_id 0
                :term_buf (- 1)})

(fn M.open_term_split [detach]
  (let [detach (or detach false)]
    ;; Create new buffer in an horizontal split
    (vim.cmd.vnew)
    (if (and (not detach) (vim.api.nvim_buf_is_valid state.term_buf))
        (vim.api.nvim_set_current_buf state.term_buf)
        (vim.cmd.term))
    (vim.cmd.wincmd :J)
    ;; Set height of the new split
    (vim.api.nvim_win_set_height 0 20)
    ;; Persist terminal buffer id in memory for reuse
    (when (not detach)
      (set state.term_buf (vim.api.nvim_get_current_buf))
      (set state.job_id vim.bo.channel))))

(vim.api.nvim_create_user_command "Easiterm" M.open_term_split {})
(vim.api.nvim_create_user_command "EasitermDetach" (fn [] (M.open_term_split true)) {})
(vim.api.nvim_create_autocmd "TermOpen"
                             {  :callback (fn []
                                            (set vim.opt.number false)
                                            (set vim.opt.relativenumber false))
                                :group (vim.api.nvim_create_augroup :custom-term-open { :clear true})})
(keyset :t :<esc><esc> "<c-\\><c-n>")
(keyset :n :<space>tt M.open_term_split {:desc "[T]erminal toggle on split"})
(keyset :n :<space>to (fn [] (M.open_term_split true))
                {:desc "[T]erminal [o]pen detached on split"})
(keyset :n :<space>ti (fn []
                        (set state.current_command (vim.fn.input "Command: ")))
                {:desc "[T]erminal [i]nput command"})
(keyset :n :<space>tx
                (fn []
                  (when (= state.current_command "")
                    (set state.current_command (vim.fn.input "Command: ")))
                  (vim.fn.chansend state.job_id
                                   [(.. state.current_command "\r\n")]))
                {:desc "[T]erminal e[x]exute command"})
M
