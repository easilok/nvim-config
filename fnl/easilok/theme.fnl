(local theme "tokyonight")
;; (local theme  "codescope")

(local tokyonight-settings {
       ;; The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
       :style  "night"
       :transparent true
       ;; Also set  colors used when opening an embedded `:terminal`
       :terminal_colors   true 
       :styles {
       ;; Style to be applied to different syntax groups
                :comments  { :italic  true}
                :keywords  { :italic  true}
                :functions  {}
                :variables  {}
                ;; Background styles. Can be "dark", "transparent" or "normal"
                :sidebars  "dark"
                :floats  "dark"}
       ;; Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
       :sidebars  [ "qf" "help"] 
       :day_brightness   0.7
       :hide_inactive_statusline  false
       :dim_inactive   true
       :lualine_bold  false
       :on_colors (fn [colors] (set colors.border  "#ff9c33") colors)
       })
 

(if (= theme "codescope")
    (let [codespace (require "codescope")]
      (codespace.setup { :transparent true}))
    ;; Tokio Night theme
    (let [tokyonight (require "tokyonight")]
      (tokyonight.setup tokyonight-settings)))

(vim.cmd.colorscheme theme)

; For transparency
(vim.api.nvim_set_hl 0 "Normal" {:ctermbg "none" :bg "none"})
(vim.api.nvim_set_hl 0 "NormalFloat" {:ctermbg "none" :bg "none"})

; (vim.api.nvim_set_hl 0 "CursorLineNr" {:fg "#ff9c33"}) ; orange as border
(vim.api.nvim_set_hl 0 "LineNr" {:fg "#9b9b9b"})
(vim.api.nvim_set_hl 0 "LineNrAbove" {:fg "#9b9b9b"})
(vim.api.nvim_set_hl 0 "LineNrBelow" {:fg "#9b9b9b"})
; define line highlight color
(vim.api.nvim_set_hl 0 "LineHighlight" {:ctermbg :darkgray :bg :darkgray})
