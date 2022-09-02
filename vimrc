set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/opt/homebrew/bin/fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/vimux'
Plugin 'benmills/vimux-golang'
Plugin 'wsdjeg/vim-fetch'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'
Plugin 'thosakwe/vim-flutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" Map leader key to ','
let mapleader=","

" Press jk/kj to exit from insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" Require the cursor to always be at least 4 lines away from the top or bottom of the window
set scrolloff=4

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

" Easier split resize
nnoremap <C-w>j 10<C-w>-
nnoremap <C-w>k 10<C-w>+
nnoremap <C-w>h 10<C-w><
nnoremap <C-w>l 10<C-w>>

" Remap new vertical split shortcut
map <leader>v <C-w>v

" Remap new horizontal split shortcut
map <leader>h <C-w>s

" More natural split opening - open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Add indentation guides/lines: https://vi.stackexchange.com/a/11403/15709
set cursorcolumn
set cursorline

augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

" Close a split window in Vim without resizing other windows: https://stackoverflow.com/a/486058/5394999
set noequalalways

" Autoclose parentheses, brackets and quotes
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

" When selecting an item from Popup menu with <Enter>, don't add new line: https://unix.stackexchange.com/a/334074/200517
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

" When Popup menu appears use <TAB> for selecting item
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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

" Popup window background color
hi Pmenu ctermbg=blue
hi Pmenu ctermfg=black

" Popup window foreground color
hi PmenuSel ctermfg=white

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

" Expand a Vim fold automatically when your put your cursor on it
" Source 1: https://stackoverflow.com/a/7037762/5394999
" Source 2: http://vimdoc.sourceforge.net/htmldoc/fold.html
set foldopen=all
set foldclose=all

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

" Move around hunks w/t vim-gitgutter: https://github.com/airblade/vim-gitgutter#hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Prompt for a command to run (vimux)
map <leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand (vimux)
map <leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane (vimux)
map <leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane (vimux)
map <leader>vz :VimuxZoomRunner<CR>

" Have code be formatted upon saving file (currently only for .dart files)
au BufWrite *.dart,*.json,*.ts,*.js :Autoformat

" Shortcuts for vim-go
map gr :GoReferrers<CR>
map gi :GoImplements<CR>

" Syntax highlighting from vim-go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1

let g:go_metalinter_autosave = 1
let g:go_updatetime = 250
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
hi def goSameId ctermbg=18 ctermfg=white

" Use deoplete for autocompletion
let g:deoplete#enable_at_startup = 1

" Instructs deoplete to use omni completion for Go files
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Golang specific vimux mapping for running tests
map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>

" Finding files with fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-e> :History<CR>

" Nicer previewer program (bat) than cat when listing files with fzf: https://github.com/junegunn/fzf.vim#example-customizing-files-command
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/bundle/fzf.vim/bin/preview.sh {}']}, <bang>0)

" With the below command, every time we invoke Rg, FZF + ripgrep will not consider filename as a match in Vim
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Rg command with preview window: https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Finding in files with fzf and ripgrep
nnoremap <silent> <C-s> :Rg<CR>

" Flutter command mappings
map fr :FlutterRun<CR>
map fs :FlutterSplit<CR>
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

" Automatically open __Flutter_Output__ when starting flutter using :FlutterRun
let g:flutter_show_log_on_run=0

" Disable leafgarland/typescript-vim's autoindenting: https://github.com/leafgarland/typescript-vim#indenting
let g:typescript_indent_disable = 1

" Automatically set paste mode in Vim when pasting in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
