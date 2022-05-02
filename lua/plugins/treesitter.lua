--------------------------------------------------------------------------
-- Treesitter
--------------------------------------------------------------------------

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup {
  ensure_installed = 'all',
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- Don't install phpdoc b/c it's broken on M1 Macs
  highlight = {
    enable = true, -- `false` will disable the whole extension
    additional_vim_regex_highlighting = true, -- compatibility with ruby endwise
  },
}
