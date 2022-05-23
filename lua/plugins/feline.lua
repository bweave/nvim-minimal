local feline = require('feline')
local vi_mode_utils = require('feline.providers.vi_mode')

local left = {
  {
    provider = 'vi_mode',
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        bg = 'NONE',
        fg = vi_mode_utils.get_mode_color(),
        style = 'bold',
      }
    end,
    icon = '',
    left_sep = { ' ' },
    right_sep = { ' ' },
  },
  {
    provider = 'file_info',
    hl = {
      fg = 'white',
      bg = 'oceanblue',
      style = 'bold',
    },
    left_sep = {
      'slant_left_2',
      { str = ' ', hl = { bg = 'oceanblue', fg = 'NONE' } },
    },
    right_sep = {
      { str = ' ', hl = { bg = 'oceanblue', fg = 'NONE' } },
      'slant_right_2',
      ' ',
    },
  },
  {
    provider = 'diagnostic_errors',
    hl = { fg = 'red' },
  },
  {
    provider = 'diagnostic_warnings',
    hl = { fg = 'yellow' },
  },
  {
    provider = 'diagnostic_hints',
    hl = { fg = 'cyan' },
  },
  {
    provider = 'diagnostic_info',
    hl = { fg = 'skyblue' },
  },
}

local right = {
  {
    provider = 'git_branch',
    hl = {
      fg = 'white',
      bg = 'black',
      style = 'bold',
    },
    right_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'black',
      },
    },
  },
  {
    provider = 'git_diff_added',
    hl = {
      fg = 'green',
      bg = 'black',
    },
  },
  {
    provider = 'git_diff_changed',
    hl = {
      fg = 'orange',
      bg = 'black',
    },
  },
  {
    provider = 'git_diff_removed',
    hl = {
      fg = 'red',
      bg = 'black',
    },
    right_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'black',
      },
    },
  },
  {
    provider = 'position',
    left_sep = { ' ' },
    right_sep = { ' ' },
  },
}

local inactive_left = {
  {
    provider = 'file_info',
    hl = {
      fg = 'white',
      bg = 'NONE',
      style = 'bold',
    },
    left_sep = { ' ' },
    right_sep = { ' ' },
  },
}

local inactive_right = {
}

local components = {
  active = { left, right },
  inactive = { inactive_left, inactive_right },
}

local theme = {
  black = '#1B1B1B',
  skyblue = '#50B0F0',
  cyan = '#009090',
  green = '#60A040',
  oceanblue = '#0066cc',
  magenta = '#C26BDB',
  orange = '#FF9000',
  red = '#D10000',
  violet = '#9E93E8',
  white = '#FFFFFF',
  yellow = '#E1E120',
}

if vim.o.background == 'dark' then
  theme.bg = '#1F1F23'
  theme.fg = '#D0D0D0'
else
  theme.bg = '#D8DEE9'
  theme.fg = '#1F1F23'
end

feline.setup({
  theme = theme,
  components = components,
})
