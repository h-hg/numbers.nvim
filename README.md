# Numbers.nvim

Disables relative line numbers when entering INSERT mode.

Different from other similar plugins, it will display absolute number when losing focus.

## Requirement

- Neovim >= 0.7

## Usage

```lua
require('packer').startup(function(use)
  use {
    'h-hg/numbers.nvim',
    config = function()
      require('numbers').setup {
        -- write your configuration here
      }
    end
  }
end)
```

The default configuration

```lua
{
  excluded_filetypes = {
    startify = true,        -- mhinz/vim-startify
    dashboard = true,       -- glepnir/dashboard-nvim
    alpha = true,           -- goolord/alpha-nvim
    Outline = true,         -- simrat39/symbols-outline.nvim
    fugitive = true,        -- tpope/vim-fugitive
    packer = true,          -- wbthomason/packer.nvim
    NvimTree = true,        -- kyazdani42/nvim-tree.lua
    TelescopePrompt = true, -- nvim-telescope/telescope.nvim
  },
  excluded_buftyeps = {
    terminal = true,
  }
}
```

## Alternative

- [myusuf3/numbers.vim](https://github.com/myusuf3/numbers.vim)
- [nkakouros-original/numbers.nvim](https://github.com/nkakouros-original/numbers.nvim)
