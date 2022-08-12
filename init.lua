-- All the plugins
require('packer').startup(function(use)
	-- Plugin Manager
	use 'wbthomason/packer.nvim'
	-- Auto pairing of brackets, inverted commas etc
	use 'jiangmiao/auto-pairs'
	-- Colorscheme
	use 'EdenEast/nightfox.nvim'
	-- Statusline
	use {
	  'nvim-lualine/lualine.nvim',
	}
	-- Plugin for commenting
	use 'b3nj5m1n/kommentary'
	-- Fonts
end)

-- Lualine setup
require('lualine').setup {
  options = {
    theme = 'material',
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
  }
}

-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.scrolloff = 2

--------------------------------------------------------------------------------
-- START SECTION FOR KEY REMAPS
--------------------------------------------------------------------------------

map = vim.api.nvim_set_keymap

-- Convenience for moving between buffers
map("n", "gn", ":bn<CR>", {noremap = true, silent = true})
map("n", "gp", ":bp<CR>", {noremap = true, silent = true})
map("n", "gd", ":bd<CR>", {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- END SECTION FOR KEY REMAPS
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- START SECTION FOR VIM COMMANDS
--------------------------------------------------------------------------------

vim.cmd("colorscheme nightfox")

-- Highligh yanked text
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])

--------------------------------------------------------------------------------
-- END SECTION FOR VIM COMMANDS
--------------------------------------------------------------------------------
