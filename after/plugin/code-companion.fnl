(local {: keyset} (require :easilok.utils))

(local available-models [:google/gemini-2.5-pro
                         :google/gemini-2.5-flash-preview-05-20
                         :anthropic/claude-sonnet-4
                         :anthropic/claude-3.7-sonnet
                         :openai/gpt-4o-mini])

(var current-model :openai/gpt-4o-mini)
(fn select-model []
    (vim.ui.select available-models {:prompt "Select  Model:"}
                   (fn [choice]
                     (when choice
                        (set current-model choice)
                        (vim.notify (.. "Selected model: " current-model))))))

(fn create-openrouter-adapter []
  (let [adapters (require :codecompanion.adapters)]
    (adapters.extend "openai_compatible"
                     { :env { :url "https://openrouter.ai/api"
                              :api_key "OPENROUTER_API_KEY"
                              :chat_url "/v1/chat/completions"}
                        :schema { :model { :default current_model}}})))

(let [(ok codecompanion) (pcall require :codecompanion)]
    (when ok 
        (codecompanion.setup { :telescope_integration true
                                        :lsp_integration true
                                        :strategies {:chat { :adapter "anthropic"
                                                                  :model "claude-sonnet-4-20250514"}}
                                                    :inline { :adapter "anthropic"
                                                                :model "claude-sonnet-4-20250514"}
                                    :adapters { :openrouter create-openrouter-adapter}})

        (keyset :n :<space>cc #(vim.call "CodeCompanionChat toggle" {:desc "Toggle CodeCompanion"}))
        (keyset :v :<space>ca #(vim.call "CodeCompanionAsk") {:desc "Ask about selected code"})
        (keyset :n :<space>cm select-model {:desc "Select Openrouter module"})  
        ;; Still need to understand how to configure this
        (keyset :v :<space>cr #(vim.call "CodeCompanionReview") {:desc "Review selected code"})
        (keyset :v :<space>ct #(vim.call "CodeCompanionTest") {:desc "Generate tests for selected code"})
        (keyset :n :<space>cf #(vim.call "CodeCompanionFix") {:desc "Fix problems in current buffer"})))
