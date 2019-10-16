set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line


" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map leader key to ','
let mapleader=","

" Move lines around using the leader key + j,k
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv"

" Autoclose parentheses, brackets and quotes
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number " Show current line number
set relativenumber " Show relative line numbers

" List command-line auto-completion suggestions
set wildmenu

" Enable syntax highlighting
syntax on

" Enable 256-color mode
set t_Co=256

" Hide buffer when switching files (when buffer is abandoned)
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Show current command in the bottom right corner when typed
set showcmd
