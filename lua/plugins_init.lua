-- Plugins
local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Get Packer if it's not present
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  use { 'projekt0n/github-nvim-theme' }
  use { 'kyazdani42/nvim-web-devicons' } -- sweet icons
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'famiu/feline.nvim', requires = { 'kyazdani42/nvim-web-devicons' }} -- Statusline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup{
        options = {
          name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('term') then
              return vim.fn.fnamemodify(buf.name, ':t')
            end
          end,
          offsets = {{ filetype = "NvimTree", text = "File Explorer", text_align = "left" }},
        }
      }
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
  use { 'dense-analysis/ale' }
  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }} -- Dashboard (start screen)
	use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {
    'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require'fzf-lua'.setup {
        winopts = {
          height           = 0.40,            -- window height
          width            = 1,            -- window width
          row              = 1,            -- window row position (0=top, 1=bottom)
          col              = 0,            -- window col position (0=left, 1=right)
        },
        fzf_opts = {
          ['--info']      = 'hidden',
          ['--layout']      = false,
        },
      }
    end,
  }
  use { 'vijaymarupudi/nvim-fzf' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-obsession' }
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'vim-test/vim-test' }
  use { 'wincent/vim-clipper' }
  use { 'pangloss/vim-javascript' }
  use { 'rktjmp/lush.nvim' }
  use {
    'maxmellon/vim-jsx-pretty',
    config = function()
      vim.g.vim_jsx_pretty_colorful_config = 1
    end
  }
  use {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_leader_key = ','
    end
  }
  use {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_split_mapping = ''
      vim.g.splitjoin_join_mapping = ''
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_ruby_hanging_args = 0
    end
  }
  use {
    'kassio/neoterm',
    config = function()
      vim.g.neoterm_default_mod = "vert botright 80"
      vim.g.neoterm_repl_ruby = "pry"
      vim.g.neoterm_autoinsert = "1"
    end,
  }
  use { 'folke/which-key.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Reloads neovim and plugins whenever you save this file
cmd [[
  augroup user_config
    autocmd!
    autocmd BufWritePost plugins_init.lua source <afile> | PackerSync
  augroup end
]]
