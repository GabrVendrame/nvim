# Neovim Configuration

This repository contains my personal configuration for the Neovim editor. It includes custom settings, plugin management (using folke/lazy.nvim), and key remappings to enhance the Neovim experience.

## Description

This project is a collection of my custom Neovim configurations. It leverages the folke/lazy.nvim package manager to handle plugins and includes various remaps and tweaks for improved productivity. Some parts of this configuration are inspired by ThePrimeagen and the kickstart.nvim project.

## Installation

1. Make sure you have [Neovim](https://neovim.io/) installed.
2. Cloning this repository:
    
    **Linux**
    ```sh
    git clone <repository-url> ~/.config/nvim
    ```

    **Windows**
    ```sh
   git clone <repository-url> ~/AppData/Local/nvim
   ```

3. Launch Neovim. Plugins will be installed automatically via lazy.nvim.

> **Note for Windows Users:**  
> Neovim on Windows can sometimes behave unexpectedly due to differences in file paths, shell environments, and plugin compatibility.

## Prerequisites

- [Neovim](https://neovim.io/) v0.11 or higher (required: `vim.lsp.config`, `vim.diagnostic.jump`, `vim.hl.on_yank`)

**Note:**
v0.12.5 used while building this configuration.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.