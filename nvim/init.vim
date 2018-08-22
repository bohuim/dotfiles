" Make vim behave in a more useful way
" Must be the first thing in config
set nocompatible

" ========================================
" vim-plug
" ========================================
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'joshdick/onedark.vim'     " Color Scheme
Plug 'itchyny/lightline.vim'    " Status Line
Plug 'scrooloose/nerdtree'      " File explorer

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
Plug 'majutsushi/tagbar'            " Outline tag bar 
Plug 'ervandew/supertab'            " Tab completion
Plug 'ctrlpvim/ctrlp.vim'           " Omnibar

call plug#end()

" ========================================
" Editor
" ========================================
set exrc            " Allow per project config
set secure

set showcmd         " Show the currently inputting command
set hlsearch        " Highligh search

filetype plugin on
syntax enable 

set nowrap
set number          " Line numbers
" set cursorline      " Highlight current line
set tabstop=4       " Set visual of \t as 4 spaces.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set hidden
set history=100     " Remember last 100


" ========================================
" Mapping & Bindings
" ========================================
nnoremap ; :
vnoremap ; :

nnoremap <Space> <nop>
let mapleader=" "   " Use space as <LeaderKey>

let g:BASH_Ctrl_j = 'off'
noremap <leader>h :noh<cr>

" skip 10 lines instead of pages
nnoremap <C-d> 10j
nnoremap <C-u> 10k

" p -> paste on cursor
" P -> paste after cursor
nnoremap p P
vnoremap p P
nnoremap P p
vnoremap P p

" Move windows with C-hjkl
nnoremap <leader>w <C-w>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! _NERDTreeToggle()
    if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
        " If explorer is active, simply close it
        execute "NERDTreeToggle"
    else
        " Show explorer and make window immutable
        let l:currentWindow = winnr()
        execute "NERDTreeToggle"
        execute "set nomodifiable"
        exe l:currentWindow . "wincmd p"
    endif
endfunction
nnoremap <silent> <leader>e :call _NERDTreeToggle()<CR>

" NerdCommenter (ctrl-/ to toggle)
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:NERDCreateDefaultMappings = 0
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

" Tagbar
nnoremap <leader>o :TagbarToggle<CR> 

" CtrlP
nnoremap <C-o> :CtrlPTag<CR>
vnoremap <C-o> :CtrlPTag<CR>

" Change moving up and down selection to C-p & C-n
" history selection as up/down, C-j/C-k
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<C-n>'],
    \ 'PrtSelectMove("k")':   ['<C-p>'],
    \ 'PrtHistory(-1)':       ['<C-k>', '<down>'],
    \ 'PrtHistory(1)':        ['<C-j>', '<up>'],
    \ }
