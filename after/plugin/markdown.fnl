(local {: keyset} (require :easilok.utils))

;; Instant Markdown Preview
; Uncomment to override defaults:
; (set vim.g.instant_markdown_slow 1)
(set vim.g.instant_markdown_autostart 0)
;(set vim.g.instant_markdown_open_to_the_world 1)
(set vim.g.instant_markdown_allow_unsafe_content 1)
; (set vim.g.instant_markdown_allow_external_content 0)
(set vim.g.instant_markdown_mathjax 1)
(set vim.g.instant_markdown_mermaid 1)
; (set vim.g.instant_markdown_logfile "/tmp/instant_markdown.log")
; (set vim.g.instant_markdown_autoscroll 0)
; (set vim.g.instant_markdown_port 8888)
; (set vim.g.instant_markdown_python 1)
(set vim.g.instant_markdown_theme "dark")
(set vim.g.instant_markdown_browser "firefox --new-window")
 
;; Render markdown in buffer
; (local render-markdown (require "render-markdown"))
; (render-markdown.setup { :code {
;                                 :sign false
;                                 :width "block"
;                                 :right_pad 1
;                                 :inline_right "`"
;                                 :inline_left "`"}
;                           :heading { :enabled false 
;                                      :sign false
;                                      :icons []}
;                           :pipe_table { :enabled false}
;                           :checkbox  { :enabled false}
;                           :bullet  { :enabled true}})


(fn markdown-table-format []
    (vim.cmd "Tabularize\\|"))

(vim.api.nvim_create_autocmd "FileType" { :pattern "markdown"
                                          :callback (fn [ event]
                                                      (vim.api.nvim_create_user_command "TabFormat" markdown-table-format {})
                                                      (keyset [:n :v] :<space>mt markdown-table-format { :desc "[M]arkdown [T]able format"}))})
                                         

