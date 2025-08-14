(local {: keyset} (require :easilok.utils))

(local state {  :floating { :buf (- 1)
                            :win (- 1)}})

(fn buffer? [buf]
  "Checks if a buffer is valid"
  (and buf (vim.api.nvim_buf_is_valid buf)))

(fn create-buffer-window [buf height width col row]
    (let [buf (if (buffer? buf) buf (vim.api.nvim_create_buf false true))]
      {: buf
       :win (vim.api.nvim_open_win buf
                                   true
                                   {:border "rounded"
                                    :col col
                                    :row row
                                    :height height
                                    :width width
                                    :relative "editor"})}))

(fn create-floating-window [opts]
  (let [opts (or opts {})
        width (or opts.width (math.floor (* vim.o.columns 0.8)))
        height (or opts.height (math.floor (* vim.o.lines 0.8)))
        col (math.floor (/ (- vim.o.columns width) 2))
        row (math.floor (/ (- vim.o.lines height) 2))]
    (create-buffer-window opts.buf height width col row)))

(fn toggle-terminal []
  (if (not (vim.api.nvim_win_is_valid state.floating.win))
      (do
        (set state.floating (create-floating-window {:buf state.floating.buf}))
        (when (not (= (. vim.bo state.floating.buf :buftype) "terminal"))
          (vim.cmd.terminal)))
      (vim.api.nvim_win_hide state.floating.win)))

(vim.api.nvim_create_user_command :Floaterminal toggle-terminal {})

(keyset :n :<space>tf toggle-terminal {:desc "[T]erminal [f]loat"})  

{}
