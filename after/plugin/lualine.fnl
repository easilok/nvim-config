(local lualine (require :lualine))
(local bufferline (require :bufferline))
(local theme (require :easilok.theme))

(lualine.setup { :options { :theme theme.theme
                            :powerline_fonts false
                            :component_separators { :left "|" :right "|"}
                            :section_separators { :left "" :right ""}
                            :disabled_filetypes [ "NvimTree" "packer" "undotree" "diff"]
                            :always_divide_middle true
                            :globalstatus true
                            :refresh { :statusline 1000
                                       :tabline 1000
                                       :winbar 1000}}
                :sections { :lualine_a [ "mode"]
                            :lualine_b [ "branch" "diff" "diagnostics" "ObsessionStatus"]
                            :lualine_c [ { 1 "filename" :path 3}]
                            :lualine_x [ "encoding" "fileformat" "filetype" "tabnine"]
                            :lualine_y [ "progress"]
                            :lualine_z [ "location"]}
                :inactive_sections { :lualine_a []
                                     :lualine_b []
                                     :lualine_c [ { 1 "filename" :path 3}]
                                     :lualine_x [ "location"]
                                     :lualine_y []
                                     :lualine_z []}
                :tabline {}
                :winbar {}
                :inactive_winbar {}
                :extensions {}})

(bufferline.setup { :options { :numbers "buffer_id"
                               :close_command nil
                               :right_mouse_command nil
                               ::indicator { :icon "▎"
                                             :style "icon"}
                              :show_buffer_icons true
                              :show_buffer_close_icons false
                              :diagnostics "nvim_lsp"
                              :offsets [ { :filetype "NvimTree"
                                           :text ""
                                           :separator true}]}})
