local cmd = vim.api.nvim_create_user_command

cmd("Branches", "lua require('fzf-git').branches()", {})
cmd("Stashes", "lua require('fzf-git').stashes()", {})
