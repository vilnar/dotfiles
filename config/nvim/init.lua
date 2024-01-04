-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --

vim.opt.number = false
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.opt.display = 'truncate'
vim.opt.listchars = {tab = "> ", space = ".", trail= "*", precedes = '<', extends = ">", eol = "$" }

-- ========================================================================== --
-- ==                           EDIT                                       == --
-- ========================================================================== --
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ========================================================================== --
-- ==                             KEYBINDINGS                              == --
-- ========================================================================== --

-- Space as leader key
vim.g.mapleader = ' '

-- Shortcuts
vim.keymap.set({'n'}, '<leader>o', ':only<cr>')
vim.keymap.set({'n'}, '<leader>qq', ':bw %<cr>')
vim.keymap.set({'n'}, '<leader>h', ':noh<cr>')
vim.keymap.set({'n'}, '<leader>cl', ':normal ^vg_"+y<cr>')

vim.keymap.set({'n'}, '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set({'n'}, '<leader>nt', ':NvimTreeOpen<cr>')
vim.keymap.set({'n'}, '<leader>nf', ':NvimTreeFindFile<cr>')
vim.keymap.set({'n'}, '<leader>;', ':Telescope commands<cr>')
-- vim.keymap.set({'n'}, '<leader>b', ':Telescope buffers<cr>')
vim.keymap.set({'n'}, '<leader>b', ':ShowBufferList<cr>')

vim.keymap.set({'n'}, '<F8>', ':set wrap!<cr>')
vim.keymap.set({'n'}, '<F9>', ':set list!<cr>')
vim.keymap.set({'i', 'v'}, '<F9>', '<ESC>:set list!<cr>')


-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- paste

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- Commands
vim.keymap.set({'n'}, '<leader>w', ':write<cr>')


-- ========================================================================== --
-- ==                               LANG                                   == --
-- ========================================================================== --
vim.opt.keymap = "ukrainian-jcuken"
vim.opt.iminsert = 0

-- ========================================================================== --
-- ==                               COMMANDS                               == --
-- ========================================================================== --

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

local group = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = group,
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 800})
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = group,
  command = 'nnoremap <buffer> q :quit<cr>'
})


-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'folke/tokyonight.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
  {"nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }},
  {'sindrets/diffview.nvim'},
  {'PhilRunninger/bufselect'},
})


-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

---
-- Colorscheme
---
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')


---
-- lualine.nvim (statusline)
---
vim.opt.showmode = true
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
    -- component_separators = '|',
    -- section_separators = '',
  },
})

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  git = {
      enable = false,
  },
})

require('nvim-web-devicons').setup({
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = false;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = false;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
})

require("diffview").setup({
diff_binaries = false,
})

function CheckLua()
    local message = "test"
    local newtest = 22
    if newtest > 10 then
        print("wtf")
    end
    print("debug", message, newtest)
end

vim.keymap.set({'n'}, '<leader>e', ':lua CheckLua()<cr>')

vim.keymap.set({'n'}, '<leader>gg', ':!grep -rIni --exclude-dir=".git" "" ./<left><left><left><left>')
vim.keymap.set({'n'}, '<leader>rr', ':,$s///gc<left><left><left><left>')

