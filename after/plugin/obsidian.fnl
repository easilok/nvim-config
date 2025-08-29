(local {: keyset} (require :easilok.utils))

(local obsidian (require :obsidian))
(local base_dir "~/Nextcloud/Obsidian")

(when (not (= (vim.fn.isdirectory (vim.fn.expand base_dir)) 0))
    (obsidian.setup { :workspaces [ { :name "work"
                                      :path (.. base_dir "/Work")}
                                    { :name "personal"
                                      :path (.. base_dir "/Personal")}
                                    { :name "knowledge"
                                      :path ( .. base_dir "/Knowledge")
                                      :overrides { :templates
                                                   { :folder "99 - templates"
                                                     :date_format "%Y-%m-%d"
                                                     :time_format "%H:%M"}}}]
                       :daily_notes { :folder "journal"
                                      :date_format "%Y-%m-%d"
                                      :default_tags [ "journal"]
                                      :template nil}

                       :templates { :folder "templates"
                                    :date_format "%Y-%m-%d"
                                    :time_format "%H:%M"}
                       :preferred_link_style "markdown"
                       :disable_frontmatter true
                       :mappings { :<space>ch { :action (fn [] (obsidian.util.toggle_checkbox))
                                                :opts { :buffer true}}}
                       :ui { :checkboxes {  " " nil
                                            "x" nil
                                            ">" nil
                                            "~" nil
                                            "!" nil}
                             :bullets {:char "-" :hl_group "ObsidianBullet"}}})

    (keyset :n :<space>ow #(vim.cmd "ObsidianWorkspace") { :desc "Switch [O]bsidian [W]orkspace"})
    (keyset :n :<space>oq #(vim.cmd "ObsidianQuickSwitch") { :desc "Switch [O]bsidian [Q]uick Switch"})
    (keyset :n :<space>og #(vim.cmd "ObsidianSearch") { :desc "Switch [O]bsidian Search"}))
