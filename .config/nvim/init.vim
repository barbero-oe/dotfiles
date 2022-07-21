" Using NeoVim
" Using [VimPlug](https://github.com/junegunn/vim-plug) as plugging manager
" To install:
" > sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" To install plugins run in ex mode:
" :PlugInstall
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
" Plug 'arcticicestudio/nord-vim'
Plug '~/.fzf'
Plug 'sainnhe/sonokai'
" Plug 'morhetz/gruvbox'
" Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'machakann/vim-highlightedyank'
Plug 'google/vim-jsonnet'
Plug 'doums/darcula'
Plug 'dracula/vim'
call plug#end()

set ignorecase
set smartcase
set number
" set relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Weird MacOS fix. It can't copy spcecial characters
set fileencoding=utf-8
lang en_US.UTF-8

nnoremap <C-m> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1


let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.8, 'yoffset': 1.0 } }
let fzf_options = { 'source': 'fd --type file --hidden' }
nnoremap <C-p> :call fzf#run(fzf#wrap(fzf_options))<CR>

let g:highlightedyank_highlight_duration = 400

" True colors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Themes
" Default
" let g:airline_theme='light'

" rakr/vim-one
" set background=light
" let g:one_allow_italics = 1
" colorscheme one
" let g:airline_theme='one'

" morhetz/gruvbox
" let g:gruvbox_italic=1
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

" nord
" colorscheme nord
" let g:airline_theme='nord'

" Sonokai
" colorscheme sonokai
" let g:sonokai_style = 'atlantis'

" Darcula
colorscheme darcula
let g:airline_theme='atomic'

" Dracula
" colorscheme dracula
