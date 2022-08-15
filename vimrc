set nocompatible              " be iMproved, required
filetype off                  " required
	
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/opt/homebrew/bin/fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/vimux'
Plugin 'wsdjeg/vim-fetch'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'
Plugin 'thosakwe/vim-flutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" Map leader key to ','
let mapleader=","

" Press jk/kj to exit from insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-w>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Remap new vertical split shortcut
map <leader>v <C-w>v

" Remap new horizontal split shortcut
map <leader>h <C-w>s

" More natural split opening - open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Autoclose parentheses, brackets and quotes
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

" Set default tab length to be equivalent to the length of 4 spaces
set tabstop=4

" An indent to correspond to a single tab
set shiftwidth=4

" Try to use tab bytes alone
set noexpandtab

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

" Use the system clipboard for copy and paste
set clipboard=unnamed

" Make Vim's updatetime shorter (default is 4000 ms)
set updatetime=100

" Turn on search highlighting on word being searched with '*'
set hlsearch

" Enable syntax folding
set foldmethod=syntax

" Save current file with ,w instead of typing :w every time
nnoremap <leader>w :w!<CR>

" Save current file and quit with ,wq instead of typing :wq every time
nnoremap <leader>wq :wq<CR>

" Quit current file with ,q instead of typing :q every time
nnoremap <leader>q :q<CR>

" Easily open .vimrc
map <leader><leader> :vsp $GITPATH/github.com/NickyMateev/dotfiles/vimrc<CR>

" Reload .vimrc
map <leader>. :source ~/.vimrc<CR>

" Open and close NerdTree with <Ctrl-n>
map <silent> <C-n> :NERDTreeToggle<CR>

" View the current buffer (file) in NERDTree
map <leader>r :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Prompt for a command to run (vimux)
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand (vimux)
map <Leader>vl :VimuxRunLastCommand<CR>

" Finding files with fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-e> :History<CR>

" With the below command, every time we invoke Rg, FZF + ripgrep will not consider filename as a match in Vim
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Finding in files with fzf and ripgrep
nnoremap <silent> <C-s> :Rg<CR>

" Flutter command mappings
map fr :FlutterRun<CR>
map fq :FlutterQuit<CR>

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" Map dart filetype to the command that starts the language server
let g:lsc_server_commands = {'dart': 'dart_language_server'}

" Use all the vim-lsc defaults
let g:lsc_auto_map = v:true

" Autoscroll the flutter log when 1, defaults to 0
let g:flutter_autoscroll=1

" Automatically set paste mode in Vim when pasting in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
