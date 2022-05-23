local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-f>', -- binding to scroll down inside the popup
    scroll_up = '<c-b>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 5, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  b = { "<cmd>Buffers<cr>", "Buffers" },
  B = { "<cmd>Branches<cr>", "Branches" },
  c = { "<cmd>Colors<cr>", "Colors" },
  C = { "<cmd>Commits<cr>", "Commits" },
  e = {
    name = "Editor",
    c = { "<cmd>Files ~/.config/nvim<cr>", "Find config file"},
    d = { "<cmd>Files ~/dotfiles<cr>", "Find dotfile"},
    f = { "<cmd>so ~/.config/nvim/lua/plugins/feline.lua<cr>", "Reload feline (status bar)" },
    r = { "<cmd>so ~/.config/nvim/init.lua<cr>", "Reload config" },
  },
  E = { "<cmd>NvimTreeToggle<cr>", "Explorer toggle" },
  f = { "<cmd>Files<cr>", "Files" },
  F = { "<cmd>NvimTreeFindFile<cr>", "Find file" },
  g = {
    name = "Git",
    b = {
      name = "Blame",
      f = { "<cmd>Git blame<cr>", "File" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Line" },
    },
    B = { "<cmd>GBrowse! ", "Browse on Github" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    h = {
      name = "Hunk",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Unstage Hunk" },
    },
    s = { "<cmd>vertical Git<cr>", "Status" },
    S = { "<cmd>GStashList<cr>", "Stashes" },
  },
  G = {
    name = "Go to",
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
  },
  h = { "<cmd>set hlsearch! hlsearch?<cr>", "Highlight toggle" },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
    d = { "<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<cr>", "Line diagnostics" },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
  },
  p = { "<cmd>set invpaste<cr>", "Paste mode toggle" },
  P = {
    name = "Packer",
    c = { "<cmd>PackerClean<cr>", "Clean" },
    C = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    l = { "<cmd>PackerStatus<cr>", "List" },
    L = { "<cmd>PackerLoad<cr>", "Load" },
    p = { "<cmd>PackerProfile<cr>", "Profile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = {
      name = "Snapshot",
      s = { "<cmd>PackerSnapshot<cr>", "Snapshot" },
      d = { "<cmd>PackerSnapshotDelete<cr>", "SnapshotDelete" },
      r = { "<cmd>PackerSnapshotRollback<cr>", "SnapshotRollback" },
    },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  r = {
    name = "Rails",
    c = { "<cmd>Files app/controllers<cr>", "Controllers" },
    j = { "<cmd>Files app/javascript/src<cr>", "Javascript" },
    J = { "<cmd>Files app/jobs<cr>", "Jobs" },
    g = {
      name = "Graphs",
      a = { "<cmd>Files app/graphs/app_graph<cr>", "App Graph" },
      c = { "<cmd>Files app/graphs/church_center_graph<cr>", "Church Center Graph" },
      p = { "<cmd>Files app/graphs/planning_center_graph<cr>", "Planning Center Graph" },
    },
    h = {
      name = "Hashes",
      c = { "<cmd>HashColon<cr>", "to Colon" },
      r = { "<cmd>HashRocket<cr>", "to Rocket" },
    },
    m = { "<cmd>Files app/models<cr>", "Models" },
    q = { "<cmd>Files app/queries<cr>", "Queries" },
    s = { "<cmd>Files app/services<cr>", "Services" },
    v = { "<cmd>Files app/views<cr>", "Views" },
  },
  s = {
    name = "Search",
    w = { ":Rg <C-R><C-W><cr>", "Word under cursor" },
    p = { ":Rg ", "Project", silent = false },
  },
  S = { "<cmd>vs .vscode/scratchpad_local.md<cr>", "Scratchpad" },
  t = {
    name = "Test",
    r = { "<cmd>Texec rerun\\ -bcx\\ --no-notify\\ --\\ bin/rails\\ test\\ %<cr>", "Rails rerun file" },
    R = { "<cmd>Texec rerun\\ -bcx\\ --no-notify\\ --\\ bin/rails\\ test\\ test/", "Rails rerun file" },
    t = { "<cmd>TestFile<cr>", "File" },
    T = { "<cmd>TestNearest<cr>", "Nearest" },
  },
  T = {
    name = "Terminal",
    n = { "<cmd>Tnew<cr>", "New" },
    r = {
      name = "REPL",
      f = { "<cmd>TREPLSendFile<cr>", "Send file" },
      l = { "<cmd>TREPLSendLine<cr>", "Send line" },
      s = { "<cmd>TREPLSendSelection<cr>", "Send selection" },
    },
  },
  w = { "<cmd>bdelete!<cr>", "Buffer delete" },
}

local which_key = require 'which-key'
which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register({
  r = {
    name = "Ruby",
    h = {
      name = "Hash",
      c = { ":HashColon<cr>", "to Colon" },
      r = { ":HashRocket<cr>", "to Rocket" },
    },
  },
}, {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
})
