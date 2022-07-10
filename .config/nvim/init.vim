" Using NeoVim
" Using [VimPlug](https://github.com/junegunn/vim-plug) as plugging manager
" To install:
" > sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" To install plugins run in ex mode:
" :PlugInstall
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
" Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let g:airline_powerline_fonts = 1
" let g:airline_theme='nord'
let g:airline_theme='light'
" colorscheme nord
" let g:gruvbox_italic = 1
" colorscheme gruvbox
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
nnoremap <C-m> :NERDTreeToggle<CR>
set fileencoding=utf-8
lang en_US.UTF-8

let g:ctrlp_user_command = 'fd --type file'

set number
" set relativenumber

" let g:nord_cursor_line_number_background = 1

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

