vim.g.mapleader = " "
vim.g.loaded_python3_provider = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({timeout = 250})
  end,
})

-- Tabs
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- " Weird MacOS fix. It can't copy special characters
vim.opt.fileencoding = 'utf-8'
-- lang en_US.UTF-8
vim.opt.langmenu = 'en_US.UTF-8'

