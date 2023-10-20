vim.g.mapleader = " "
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

-- GitHub
vim.opt.background = 'light'
-- colorscheme github
-- let g:airline_theme = "github"

-- nnoremap <C-m> :NERDTreeToggle<CR>
-- let g:NERDTreeGitStatusUseNerdFonts = 1

-- let g:airline#extensions#tabline#enabled = 1
-- let g:airline_powerline_fonts = 1


-- nmap s <Plug>(easymotion-overwin-f2)
-- let g:EasyMotion_smartcase = 1


-- let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.8, 'yoffset': 1.0 } }
-- let fzf_options = { 'source': 'fd --type file --hidden' }
-- nnoremap <C-p> :call fzf#run(fzf#wrap(fzf_options))<CR>

-- let g:highlightedyank_highlight_duration = 400

-- " Saving with S
-- nnoremap S :w<CR>


-- " True colors
-- " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- set termguicolors

-- " Themes
-- " Default
-- " let g:airline_theme='light'

-- " rakr/vim-one
-- " set background=light
-- " let g:one_allow_italics = 1
-- " colorscheme one
-- " let g:airline_theme='one'

-- " morhetz/gruvbox
-- " let g:gruvbox_italic=1
-- " colorscheme gruvbox
-- " let g:airline_theme='gruvbox'

-- " nord
-- " colorscheme nord
-- " let g:airline_theme='nord'

-- " Sonokai
-- " colorscheme sonokai
-- " let g:sonokai_style = 'atlantis'

-- " Darcula
-- " colorscheme darcula
-- " let g:airline_theme='atomic'

-- " Dracula
-- " colorscheme dracula

-- " PaperColor
-- " set background=light
-- " colorscheme PaperColor
-- " let g:airline_theme='papercolor'

-- " XCode
-- " colorscheme xcodelight
-- " " colorscheme xcodelighthc
-- " let g:airline_theme='xcodelight'

-- " GitHub
-- set background=light
-- colorscheme github
-- let g:airline_theme = "github"
