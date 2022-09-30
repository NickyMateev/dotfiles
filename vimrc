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
Plugin 'wsdjeg/vim-fetch'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
Plugin 'rhysd/git-messenger.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'
Plugin 'thosakwe/vim-flutter'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'SirVer/ultisnips'
Plugin 'wellle/context.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'miyakogi/conoline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'rafi/awesome-vim-colorschemes'

if has('nvim')
  Plugin 'APZelos/blamer.nvim'
endif

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

set encoding=UTF-8

" Map leader key to ','
let mapleader=","

" Pasting without losing paste register
vnoremap <leader>p "_dP

" Press jk/kj to exit from insert mode
inoremap jk <ESC>l
inoremap kj <ESC>l

" Do not wrap text if it is longer than current visible row
set nowrap

" Require the cursor to always be at least 4 lines away from the top or bottom of the window
set scrolloff=4

" Make cursor blink: https://vi.stackexchange.com/a/29130/15709
set guicursor=a:blinkwait5-blinkon5-blinkoff5

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
noremap <C-w>v :vnew<CR>

" More natural split opening - open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Close a split window in Vim without resizing other windows: https://stackoverflow.com/a/486058/5394999
set noequalalways

" Put current line to center of screen after scrolling down
nnoremap <C-d> <C-d>zz

" Delete current line without leaving insert mode
inoremap <C-d> <esc>ddi

" Autoclose parentheses, brackets and quotes
inoremap ( ()<Left>
inoremap { {}<Left><CR><Esc><S-o>
inoremap [ []<Left>
inoremap " ""<Left>

" When selecting an item from Popup menu with <Enter>, don't add new line: https://unix.stackexchange.com/a/334074/200517
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

" When Popup menu appears use <TAB> for selecting item
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

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

" Search highlight color
hi Search ctermfg=White ctermbg=136 guifg=Black guibg=Yellow

" Better Git diff colors: https://www.codyhiar.com/blog/vimdiff-better-highlighting
hi DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
hi DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
hi DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
hi DiffText   cterm=BOLD ctermfg=NONE ctermbg=23

" Clear search highlight with Esc: https://tech.serhatteker.com/post/2020-03/clear-search-highlight-in-vim/#ps
nnoremap <esc> :noh <CR>

" Popup window color schemes
hi Pmenu ctermbg=black
hi Pmenu ctermfg=white
hi PmenuSel ctermbg=63
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

" Expand all folds on open by default
set foldlevel=99

" Save current file with ,w instead of typing :w every time
nnoremap <leader>w :w!<CR>

" Save current file and quit with ,wq instead of typing :wq every time
nnoremap <leader>wq :wq<CR>

" Quit current file with ,q instead of typing :q every time
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>

" Easily open .vimrc
noremap <leader><leader> :vsp $GITPATH/github.com/NickyMateev/dotfiles/vimrc<CR>

" Reload .vimrc
noremap <leader>. :source ~/.vimrc<CR>

" Open and close NerdTree with <Ctrl-n>
noremap <silent> <C-n> :NERDTreeToggle<CR>

" View the current buffer (file) in NERDTree
noremap <leader>r :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Prompt for a command to run (vimux)
noremap <leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand (vimux)
noremap <leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane (vimux)
noremap <leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane (vimux)
noremap <leader>vz :VimuxZoomRunner<CR>

" Have code be formatted upon saving file (currently only for .dart files)
au BufWrite *.dart,*.json,*.ts,*.js :Autoformat

" Shortcuts for vim-go
noremap gr :GoReferrers<CR>
noremap gi :GoImplements<CR>

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

" Set vim-go snippet engine
let g:go_snippet_engine = "ultisnips"

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<Enter>"                                            
let g:UltiSnipsJumpForwardTrigger="<TAB>"                                       
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" Mappings for vim-fugitive:
nnoremap <C-g>s :Git status<CR>
nnoremap <C-g>m :Git commit<CR>
nnoremap <C-g>u :Git push<CR>
nnoremap <C-g>d :Git pull<CR>
nnoremap <C-g>f :Git fetch<CR>
nnoremap <C-g>ff :Git diff<CR>
nnoremap <C-g>w :.GBrowse<CR>

" Settings for 'APZelos/blamer.nvim':
let g:blamer_enabled = 1
let g:blamer_delay = 500
hi! link Blamer Ignore

" Finding files with fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-e> :History<CR>
nnoremap <silent> <C-c> :History:<CR>

" Nicer previewer program (bat) than cat when listing files with fzf: https://github.com/junegunn/fzf.vim#example-customizing-files-command
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Make fzf completely delegate its search responsibliity to ripgrep process: https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Finding in files with fzf and ripgrep
nnoremap <silent> <C-s> :RG<CR>

" Flutter command mappings
noremap fr :FlutterRun<CR>
noremap fs :FlutterSplit<CR>
noremap fq :FlutterQuit<CR>

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" Map dart filetype to the command that starts the language server
let g:lsc_server_commands = {'dart': 'dart_language_server'}

" Use the following vim-lsc key mappings
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': 'gn',
    \ 'PreviousReference': 'gp',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}

" Autoscroll the flutter log when 1, defaults to 0
let g:flutter_autoscroll=1

" Automatically open __Flutter_Output__ when starting flutter using :FlutterRun
let g:flutter_show_log_on_run=0

" Disable leafgarland/typescript-vim's autoindenting: https://github.com/leafgarland/typescript-vim#indenting
let g:typescript_indent_disable = 1

" you can add these colors to your .vimrc to help customizing: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight#configuration
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:blue " sets the color of go files to blue
let g:NERDTreeExtensionHighlightColor['md'] = s:aqua " sets the color of md files to aqua

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" Settings for 'wellle/context.vim':
let g:context_highlight_border = 'Ignore'
let g:context_highlight_normal = 'PMenu'
let g:context_highlight_border = '<hide>'
let g:context_highlight_tag = '<hide>'

" Automatically set paste mode in Vim when pasting in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
