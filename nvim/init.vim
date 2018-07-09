" ========================================
" vim-plug
" ========================================
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'    " Status Line
Plug 'joshdick/onedark.vim'     " Color Scheme

" Syntax Highlight
Plug 'sheerun/vim-polyglot'
" Completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Editing
Plug 'scrooloose/nerdcommenter'     " Commenting
Plug 'jiangmiao/auto-pairs'         " Auto complete braces
Plug 'tpope/vim-surround'           " Parentheses & nesting

call plug#end()

" ========================================
" Editor
" ========================================
set nocompatible
set showcmd         " Show the currently inputting command
set hlsearch        " Highligh search

filetype plugin on
syntax enable 

set number          " Line numbers
set tabstop=4       " Set visual of \t as 4 spaces.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set hidden
set history=100     " Remember last 100


" ========================================
" Mapping & Bindings
" ========================================
nnoremap <Space> <nop>
let mapleader=" "   " Use space as <LeaderKey>

map <leader>h :noh<cr> " cancel search highlight


" ========================================
" Appearance
" ========================================
colorscheme onedark

" Status Line
set noshowmode
set laststatus=2
let g:lightline = {}
let g:lightline.colorscheme = 'onedark'

" guifont only works for non-terminal vim
" set guifont=Menlo\ Regular:h18


" ========================================
" Plug Config 
" ========================================
" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:NERDCreateDefaultMappings = 0
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle<CR>gv

