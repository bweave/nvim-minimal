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

local normal_mode_mappings = {
  ["<leader>"] = {
    ['/'] = { "<cmd>Commentary<cr>", "Comment toggle" },
    -- b = { "<cmd>Buffers<cr>", "Buffers" },
    b = { "<cmd>lua require('fzf-lua').buffers()<cr>", "Buffers" },
    -- c = { "<cmd>Colors<cr>", "Colors" },
    c = { "<cmd>lua require ('fzf-lua').colorschemes()<cr>", "Colors" },
    -- C = { "<cmd>Commits<cr>", "Commits" },
    C = { "<cmd>lua require ('fzf-lua').git_commits()<cr>", "Commits" },
    e = {
      name = "Editor",
      -- c = { "<cmd>Files ~/.config/nvim<cr>", "Find config file"},
      c = { "<cmd>lua require 'fzf-lua'.files({ cwd = '~/.config/nvim' })<cr>", "Find nvim config file"},
      -- d = { "<cmd>Files ~/dotfiles<cr>", "Find dotfile"},
      d = { "<cmd>lua require 'fzf-lua'.files({ cwd = '~/dotfiles' })<cr>", "Find dotfile"},
      f = { "<cmd>so ~/.config/nvim/lua/plugins/feline.lua<cr>", "Reload feline (status bar)" },
      r = { "<cmd>so ~/.config/nvim/init.lua<cr>", "Reload config" },
    },
    E = { "<cmd>NvimTreeToggle<cr>", "Explorer toggle" },
    -- f = { "<cmd>Files<cr>", "Files" },
    f = { "<cmd>lua require 'fzf-lua'.files()<cr>", "Files" },
    F = {
      name = "Find",
      b = { "<cmd>lua require 'fzf-lua'.git_bcommits()<cr>", "Buffer Commits" },
      B = { "<cmd>lua require 'fzf-lua'.git_branches()<cr>", "Branches" },
      f = { "<cmd>lua require 'fzf-lua'.filetypes()<cr>", "Filetypes" },
      F = { "<cmd>NvimTreeFindFile<cr>", "File" },
      C = { "<cmd>lua require 'fzf-lua'.git_commits()<cr>", "Commits" },
      s = { "<cmd>lua require 'fzf-lua'.git_status()<cr>", "Status" },
      S = { "<cmd>lua require 'fzf-lua'.git_stashes()<cr>", "Stashes" },
    },
    g = {
      name = "Git",
      b = {
        name = "Blame",
        f = { "<cmd>Git blame<cr>", "File" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Line" },
      },
      B = { "<cmd>GBrowse!<cr>", "Browse on Github" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
      h = {
        name = "Hunk",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Unstage Hunk" },
      },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
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
    j = { "<cmd>SplitjoinSplit<cr>", "Split block" },
    k = { "<cmd>SplitjoinJoin<cr>", "Join block" },
    K = { "<cmd>lua require 'fzf-lua'.keymaps()<cr>", "Keymaps" },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
      d = { "<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<cr>", "Line diagnostics" },
      K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
    },
    L = { ':let @*=fnamemodify(expand("%"), ":~:.") . ":" . line(".")<CR>', "Copy path w/line number" },
    m = { "<cmd>lua require 'fzf-lua'.man_pages()<cr>", "Man Pages" },
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
    R = {
      name = "Ruby",
      s = {
        name = "Seeing is Believing",
        a = {
          name = "Annotate",
          a = { "<cmd>lua sib_annotate_all()<cr>", "All" },
          m = { "<cmd>lua sib_annotate_marked()<cr>", "Marked" },
        },
        c = { "<cmd>lua sib_annotate_clean()<cr>", "Clear annotations" },
        t = { "<cmd>lua sib_toggle_mark()<cr>", "Toggle mark" },
      },
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
    W = {
      name = "WhichKey mappings",
      i = { "<cmd>WhichKey '' i<cr>", "Insert mode mappings" },
      n = { "<cmd>WhichKey '' n<cr>", "Normal mode mappings" },
      t = { "<cmd>WhichKey '' t<cr>", "Terminal mode mappings" },
      v = { "<cmd>WhichKey '' v<cr>", "Visual mode mappings" },
      w = { "<cmd>WhichKey<cr>", "Top level mappings" },
    },
  },
  ["<C-p>"] = { "<cmd>lua require 'fzf-lua'.files()<cr>", "Files in project" },
  ["<C-h>"] = { "<C-w>h", "Move: Left (split)" },
  ["<C-j>"] = { "<C-w>j", "Move: Down (split)" },
  ["<C-k>"] = { "<C-w>k", "Move: Up (split)" },
  ["<C-l>"] = { "<C-w>l", "Move: Right (split)" },
  ["<C-up>"] = { "<cmd>resize -2<cr>", "Resize up" },
  ["<C-down>"] = { "<cmd>resize +2<cr>", "Resize down" },
  ["<C-left>"] = { "<cmd>vertical resize -2<cr>", "Resize left" },
  ["<C-right>"] = { "<cmd>vertical resize +2<cr>", "Resize right" },
  ["<S-left>"] = { "<cmd>bnext<cr>", "Next Buffer" },
  ["<S-right>"] = { "<cmd>bprevious<cr>", "Prev Buffer" },
}

local visual_mode_mappings = {
  ["<leader>"] = {
    ['/'] = { ":Commentary<cr>", "Comment toggle" },
    r = {
      name = "Ruby",
      h = {
        name = "Hash",
        c = { ":HashColon<cr>", "to Colon" },
        r = { ":HashRocket<cr>", "to Rocket" },
      },
    },
    T = {
      name = "Terminal",
      n = { "<cmd>Tnew<cr>", "New" },
      r = {
        name = "REPL",
        s = { "<cmd>TREPLSendSelection<cr>", "Send selection" },
      },
    },
  },
  ["<"] = { "<gv", "Dedent" },
  [">"] = { ">gv", "Indent" },
}

local insert_mode_mappings = {
  ["jk"] = { "<Esc>", "Esc" },
  -- Make completion menu work as expected,
  -- see https://superuser.com/q/246641/736190 and https://unix.stackexchange.com/q/162528/221410
  ["<Tab>"] = { 'pumvisible()?"\\<C-n>":"\\<Tab>"', "Next item (completion)", expr = true },
  ["<S-Tab>"] = { 'pumvisible()?"\\<C-p>":"\\<Tab>"', "Prev item (completion)", expr = true },
  ["<CR>"] = { 'pumvisible()?"\\<C-Y>":"\\<CR>"', "Select item (completion)", expr = true },
  ["<ESC>"] = { 'pumvisible()?"\\<C-e>":"\\<ESC>"', "Close menu (completion)", expr = true },
}

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local terminal_mode_mappings = {
  ["<Esc><Esc>"] = { t("<C-\\><C-n>"), "Esc to Normal mode" },
  ["<C-h>"]   = { t('<C-\\><C-n><C-W>h'), 'Move: Left (terminal)' },
  ["<C-j>"]   = { t('<C-\\><C-n><C-W>j'), 'Move: Down (terminal)' },
  ["<C-k>"]   = { t('<C-\\><C-n><C-W>k'), 'Move: Up (terminal)' },
  ["<C-l>"]   = { t('<C-\\><C-n><C-W>l'), 'Move: Right (terminal)' },
}

local which_key = require 'which-key'
which_key.setup(setup)
which_key.register(normal_mode_mappings, { mode = "n" })
which_key.register(visual_mode_mappings, { mode = "v" })
which_key.register(insert_mode_mappings, { mode = "i" })
which_key.register(terminal_mode_mappings, { mode = "t" })
