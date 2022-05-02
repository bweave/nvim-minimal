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

-- Edit init.lua
-- map('n', '<leader>ei', ':e ~/.config/nvim/init.lua<CR>')

map('i', 'jk', '<Esc>')             -- Map jk to Esc
-- map('n', '<leader>h', ':set invhlsearch<CR>')  -- Toggle highlight

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<leader>w', ':bd<CR>')  -- delete buffer

map('t', '<leader><Esc>', '<C-\\><C-n>')

-- map('n', '<leader>E', ':NvimTreeToggle<CR>')
-- map('n', '<leader>F', ':NvimTreeFindFile<CR>')

-- Comments
map('n', '<leader>/', ':Commentary<CR>')
map('v', '<leader>/', ':Commentary<CR>')

-- Git
-- map('n', '<leader>gs', ':vertical Git<CR>')
-- map('n', '<leader>gb', ':Git blame<CR>')
-- map('n', '<leader>gB', ':GBrowse! ')
-- map('n', '<leader>gj', "lua require 'gitsigns'.next_hunk()<CR>")
-- map('n', '<leader>gk', "lua require 'gitsigns'.prev_hunk()<CR>")
-- map('n', '<leader>gp', "lua require 'gitsigns'.preview_hunk()<CR>")
-- map('n', '<leader>gx', "lua require 'gitsigns'.reset_hunk()<CR>")
-- map('n', '<leader>gX', "lua require 'gitsigns'.reset_buffer()<CR>")
-- map('n', '<leader>gS', "lua require 'gitsigns'.stage_hunk()<CR>")
-- map('n', '<leader>gu', "lua require 'gitsigns'.undo_stage_hunk()<CR>")
-- map('n', '<leader>c', ':Commits<CR>')
-- map('n', '<leader>GB', ':Branches<CR>')
-- map('n', '<leader>GS', ':Stashes<CR>')

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
map('n', '<C-p>', ':Files<CR>')
-- map('n', '<leader>b', ':Buffers<cr>')

-- Vim Test
-- map('n', '<leader>t', ':TestFile<CR>')
-- map('n', '<leader>T', ':TestNearest<CR>')
