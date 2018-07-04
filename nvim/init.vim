" ========================================
" vim-plug
" ========================================
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" ========================================
" Appearance
" ========================================
set number " Line numbers

syntax enable 
colorscheme onedark

" Status Line
set noshowmode
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" guifont only works for non-terminal vim
" set guifont=Menlo\ Regular:h18


" ========================================
" Mapping & Bindings
" ========================================
nnoremap <Space> <nop>
let mapleader=" "   " Use space as <LeaderKey>
" set showcmd         " Show the currently inputting command


" ========================================
" Editor
" ========================================
set tabstop=4       " Set visual of \t as 4 spaces.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set hidden
set history=100     " Remember last 100

set hlsearch        " Highligh search
map <leader>h :noh<cr>

