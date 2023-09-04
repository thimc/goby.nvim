# goby.nvim

Goby.nvim is a Neovim theme that aims to look like the gobyexample.com theme.
It is written entirely in lua.

![Light screenshot](https://github.com/thimc/goby.nvim/blob/main/screenshot_light.png)

![Dark screenshot](https://github.com/thimc/goby.nvim/blob/main/screenshot_dark.png)

## Installation

<details>
<summary>Expand packer snippet: </summary>

```lua
return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  use {'thimc/goby.nvim'}
end)
```
</details>

<details>
<summary>Expand lazy snippet: </summary>

```lua
{
  'thimc/goby.nvim',
  config = function()
    -- To enable the light variant of this theme you will need to set
    -- the vim.o.background to `light`. The default value in neovim is `dark`.
    vim.o.background = 'light'
    require('gruber-darker').setup({
      -- Optional values
      transparent = true, -- (default: false) if enabled, transparent background
      italics = true, -- (default: true) disables/enables italics for comments
      underline = true, -- (default: true) disable/enables underline for spell correction
    })
    vim.cmd.colorscheme('goby')
  end,
}
```
</details>


## Plugin support

The following plugin(s) are currently supported:
- Treesitter syntax highlighting.
- tpope/fugitive

Pull requests are more than welcome!

## Note

This theme is completely independent of the gobyexample.com team.
