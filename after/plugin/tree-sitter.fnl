(local {: keyset} (require :easilok.utils))
(local treesitter (require :nvim-treesitter.configs))
(local context (require :treesitter-context))

(local language-parsers [ "bash"
                          "c"
                          "commonlisp"
                          "cpp"
                          "css"
                          "dockerfile"
                          "fennel"
                          "go"
                          "gomod"
                          "html"
                          "javascript"
                          "jsdoc"
                          "json"
                          "json5"
                          "latex"
                          "lua"
                          "make"
                          "markdown"
                          "markdown_inline"
                          "nix"
                          "php"
                          "python"
                          "rasi"
                          "regex"
                          "rust"
                          "scheme"
                          "scss"
                          "toml"
                          "tsx"
                          "typescript"
                          "vim"
                          "vimdoc"
                          "vue"
                          "yaml"])

(treesitter.setup { :ensure_installed language-parsers
                    :highlight { :enable true :additional_vim_regex_highlighting false}})


(context.setup { :enable true
                 :throttle true
                 :max_lines 3
                 :trim_scope :outer
                 :patterns { :default [ "class" "function" "method"]
                             :typescript [ "class_declaration" "abstract_class_declaration"]}
                 :zindex 20
                 :mode "cursor"
                 :separator "-"})

(keyset :n :<leader>ct #(vim.cmd "TSContextToggle"))
