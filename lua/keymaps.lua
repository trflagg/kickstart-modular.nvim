-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Shorten functon name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
local silent = { silent = true }
local noremap = { noremap = true }
local noremapAndSilent = { silent = true, noremap = true }

keymap('i', 'jk', '<ESC>', { noremap = true })

keymap('n', 'B', '^', noremap)
keymap('n', 'E', '$', noremap)
-- tmux movement
keymap('n', '<c-j>', '<c-w>j', noremap)
keymap('n', '<c-h>', '<c-w>h', noremap)
keymap('n', '<c-k>', '<c-w>k', noremap)
keymap('n', '<c-l>', '<c-w>l', noremap)
--
-- handy rename
keymap('n', '<leader>rn', '"zye:%s/<C-R>z/')

-- console log
keymap('n', '<leader>tl', "zyeoconsole.log(`taylor  <esc>Pa: ${JSON.stringify(<esc>pa, null, ' ')}`);<esc>")
keymap('n', '<leader>tc', 'zyeoconsole.log(`taylor <esc>pa `);<esc>F`i')
keymap('n', '<leader>tk', 'zyeoconsole.time(`<esc>pa `);<esc>F`i')
-- Remove highlights
keymap('n', '<ESC>', ':noh<CR><CR>', silent)

-- Buffers
keymap('n', '<Tab>', ':b#<CR>', silent)

-- Colors
keymap('n', '<leader>tb', ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', silent)

-- Toggle quicklist
keymap('n', '<leader>q', "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- because I have a hard time hitting %
keymap('n', '<c-s>', '%', silent)

keymap('n', '<leader>gy', ':Goyo<CR>:highlight Normal guibg=Black guifg=White<CR>', silent)

-- close quickflix
keymap('n', '<c-w>q', ':cclose<CR>', silent)

keymap('n', '<leader>ol', ':set background=light<CR>')
keymap('n', '<leader>od', ':set background=dark<CR>')

keymap('n', '<leader>tr', ':LspRestart<CR>', silent)
keymap('n', '<leader>tp', 'ggVG"*y')
