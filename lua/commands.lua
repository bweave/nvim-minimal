local create_cmd = vim.api.nvim_create_user_command

create_cmd("Branches", "lua require('fzf-git').branches()", {})
create_cmd("Stashes", "lua require('fzf-git').stashes()", {})
create_cmd(
  "GutentagsClearCache",
  function()
    vim.fn.system("rm " .. vim.g.gutentags_cache_dir .. "/*")
  end,
  {}
)
create_cmd("HashRocket", '<line1>,<line2>:norm ^csw"f:r a=>', { range = true })
create_cmd("HashColon", '<line1>,<line2>:norm ^ds"f xxr:', { range = true })
