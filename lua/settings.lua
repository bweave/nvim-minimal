--------------------------------------------------------------------------
-- Settings
--------------------------------------------------------------------------

-- Nvim API aliases
local cmd = vim.cmd                    -- Execute Vim command
local exec = vim.api.nvim_exec         -- Execute Vimstript
local g = vim.g                        -- Global vars
local opt = vim.opt                    -- Options (global, buffer, window-scoped)

-- General
opt.backup = false                     -- Disable backups
opt.clipboard = 'unnamed,unnamedplus'  -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noselect'   -- Autocomplete
opt.mouse = 'a'                        -- Enable mouse
opt.swapfile = false                   -- Disable swapfiles
opt.writebackup = false                -- Disable backups

-- UI
opt.colorcolumn = '121'                -- Line lenght marker at 80 columns
opt.confirm = true                     -- Ask for confirmation
opt.cursorline = true                  -- Highlight curent line
opt.expandtab = true                   -- Use spaces, not tabs
opt.foldmethod = 'marker'              -- Enable folding (default 'foldmarker')
opt.ignorecase = true                  -- Ignore case letters when search
opt.inccommand = 'nosplit'             -- Show effects of command as you type
opt.linebreak = true                   -- Wrap on word boundary
opt.joinspaces = false                 -- Don't add 2 spaces when joining lines
opt.number = true                      -- Show line number
opt.showmatch = true                   -- Highlight matching parenthesis
opt.smartcase = true                   -- Ignore lowercase for the whole pattern
opt.splitbelow = true                  -- Orizontal split to the bottom
opt.splitright = true                  -- Vertical split to the right
opt.termguicolors = true               -- Enable 24-bit RGB colors
opt.wildmode = "list:full"             -- List all items and start selecting matches in cmd completion
opt.wrap = false                       -- Disable line wrapping

-- Indentation
opt.expandtab = true                   -- Use spaces instead of tabs
opt.shiftwidth = 2                     -- Shift 2 spaces when tab
opt.smartindent = true                 -- Autoindent new lines
opt.tabstop = 2                        -- 1 tab == 2 spaces

-- Memory & CPU Performance
opt.hidden = true                      -- Enable background buffers
opt.history = 100                      -- Remember N lines in history
opt.lazyredraw = true                  -- Faster scrolling
opt.synmaxcol = 240                    -- Max column for syntax highlight
opt.updatetime = 250                   -- ms to wait for trigger an event

-- Startup
opt.shortmess:append "sI"              -- Disable nvim intro

-- Disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- Autocommands
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])  -- Remove whitespace on save

-- Terminal
cmd([[command! Term :botright vsplit term://$SHELL]])  -- Open a terminal pane on the right using :Term

-- Terminal visual tweaks:
-- enter insert mode when switching to terminal
-- close terminal buffer on process exit
cmd([[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]])
