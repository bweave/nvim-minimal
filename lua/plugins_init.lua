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

  use 'kyazdani42/nvim-web-devicons' -- sweet icons

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  use 'nvim-treesitter/nvim-treesitter'

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use "projekt0n/github-nvim-theme"

  -- fzf
	use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use { 'junegunn/fzf.vim' }
  use { 'vijaymarupudi/nvim-fzf' }

  -- tpope
  use { 'tpope/vim-commentary' } -- Git commands
  use { 'tpope/vim-endwise' } -- Git commands
  use { 'tpope/vim-fugitive' } -- Git commands
  use { 'tpope/vim-obsession' }
  use { 'tpope/vim-rails', ft = "ruby" }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }

  use { 'vim-test/vim-test' }

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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
