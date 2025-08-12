# Neovim Configuration

This repository holds my personal Neovim configuration. It started as a rewrite of my previous one for essential two
reasons:

1. My old configuration was ported from my Vim days and were missing a proper refactor for some years.
2. I wanted to write it in fennel, due to my Lisp preferences.

So this configuration files are mostly written in fennel and transpiled to lua.
The transpilation uses the [nfnl](https://github.com/Olical/nfnl) plugin which provides the fennel runtime and automatic transpilation.
I include both fennel and lua files to use the repository both as source code versioning and build distribution.

To use this configuration simply clone the repository to your user config folder. On traditional linux :

```shell
git clone https://codeberg.org/easilok/nvim-config $HOME/.config/nvim
```

At the moment, this configuration still uses [vim-plug](https://github.com/junegunn/vim-plug) to manage its packages
(which I'll change soon). So don't forget to install it and run `PlugInstall` on the first startup.

## Configurations file structure

```
|-- init.lua                               # Configuration Entrypoint
|-- .nfnl.fnl                              # nfnl transpiler plugin configurations
|-- fnl/                                   # Configurations repository in fennel
|------ easilok/                           # Personal user configurations
|-------------- init.fnl                   # Entrypoint of user configurations (mainly imports)
|-------------- keybindings.fnl            # General keybindings configuration
|-------------- plugins.fnl                # External plugins list for installation
|-------------- settings.fnl               # General neovim settings definition
|-------------- theme.fnl                  # Theme configuration and costumization
|-------------- ui.fnl                     # UI configurations (not theme related)
|-------------- utils.fnl                  # Utilitary reusable functions
|-------------- lsp.fnl                    # Lsp configuration. Includes per filetype configurations.
|-------------- lsp/<filetype-configs>.fnl # Lsp configurations per filetype
|-- lua/                                   # `fnl` directory transpiled to lua
|-- after/plugin                           # Plugin configurations picked after it is loads
|--------------- <plugin>.fnl              # <Plugin> specific configurations in fennel
|--------------- <plugin>.lua              # <Plugin> specific configurations transpiled to lua
|-- after/ftplugin                         # Filetype configurations picked after a file is open
|--------------- <filetype>.fnl            # <Filetype> specific configurations in fennel
|--------------- <filetype>.lua            # <Filetype> specific configurations transpiled to lua
```
