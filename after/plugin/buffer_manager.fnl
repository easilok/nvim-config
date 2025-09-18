(local {: keyset} (require :easilok.utils))
(local buffer-manager (require :buffer_manager))

(buffer-manager.setup { :show_indicators "before"
                        :width 0.9
                        :height 0.5})


(keyset :n :<C-e>
        (. (require :buffer_manager.ui) :toggle_quick_menu)
        { :desc  "Buffer List Manager"})

{}
