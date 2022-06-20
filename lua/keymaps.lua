--------------------------------------------------------------------------
-- Keymaps
--------------------------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

map('i', 'jk', '<Esc>')             -- Map jk to Esc

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('t', '<leader><Esc>', '<C-\\><C-n>')

-- Completions
-- When completion menu is shown, use <CR> to select an item
-- and do not add an annoying newline. Otherwise, <enter> is what it is.
-- For more info , see https://superuser.com/q/246641/736190 and
-- https://unix.stackexchange.com/q/162528/221410
map('i', '<CR>', 'pumvisible()?"\\<C-Y>":"\\<CR>"', {expr = true})
-- Use <esc> to close auto-completion menu
map('i', '<ESC>', 'pumvisible()?"\\<C-e>":"\\<ESC>"', {expr = true})
-- Use <tab> to navigate down the completion menu.
map('i', '<S-Tab>',  'pumvisible()?"\\<C-p>":"\\<Tab>"', {expr = true})
map('i', '<Tab>',  'pumvisible()?"\\<C-n>":"\\<Tab>"', {expr = true})

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Resize with arrows
map("n", "<c-up>", ":resize -2<CR>")
map("n", "<c-down>", ":resize +2<CR>")
map("n", "<c-left>", ":vertical resize -2<CR>")
map("n", "<c-right>", ":vertical resize +2<CR>")

-- keep visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- SplitJoin
map('n', '<leader>j', ':SplitjoinSplit<CR>')
map('n', '<leader>k', ':SplitjoinJoin<CR>')

-- FZF
map('n', '<C-p>', ':lua require "fzf-lua".files()<CR>')
