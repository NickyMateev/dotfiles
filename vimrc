
set rtp+=/opt/homebrew/bin/fzf

call plug#begin('~/.vim/plugged')

" Navigation plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'wsdjeg/vim-fetch'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
if has('nvim')
  Plug 'APZelos/blamer.nvim'
endif

" Programming language plugins 
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-json coc-go coc-flutter coc-sh coc-snippets'}
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'SirVer/ultisnips'
Plug 'wellle/context.vim'
Plug 'vim-autoformat/vim-autoformat'

" Appearance plugins
Plug 'tomasiser/vim-code-dark'
Plug 'miyakogi/conoline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'rafi/awesome-vim-colorschemes'

" Other plugins
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

call plug#end()

" Enable syntax highlighting
syntax on
colorscheme codedark

" Activates italicized comments (make sure your terminal supports italics)
let g:codedark_italics=1

set wildmenu " list command-line auto-completion suggestions
set encoding=UTF-8
set t_Co=256 " enable 256-color mode

set nowrap " do not wrap text if it is longer than current visible row
set scrolloff=4 " require the cursor to always be at least 4 lines away from the top or bottom of the window
set guicursor=a:blinkwait5-blinkon5-blinkoff5 " make cursor blink: https://vi.stackexchange.com/a/29130/15709

set splitbelow " open new horizontal split below
set splitright " open new vertical split to the right
set noequalalways " close a split window in Vim without resizing other windows: https://stackoverflow.com/a/486058/5394999

set tabstop=4 " set default tab length to be equivalent to the length of 4 spaces
set shiftwidth=4 " an indent to correspond to a single tab
set noexpandtab " try to use tab bytes alone

set number " show current line number
set relativenumber " show relative line numbers
set showcmd " show current command in the bottom right corner when typed
set hidden " hide buffer when switching files (when buffer is abandoned)
set smartcase

set ignorecase " use case insensitive search, except when using capital letters

set foldmethod=syntax " enable syntax folding
set foldlevel=99 " expand all folds on open by default

set mouse=a " enable use of the mouse for all modes
set clipboard=unnamed " use the system clipboard for copy and paste
set updatetime=100 " make Vim's updatetime shorter (default is 4000 ms)

" Map leader key to ','
let mapleader=","

" Pasting without losing paste register
vnoremap <leader>p "_dP

" Press jk/kj to exit from insert mode
inoremap jk <ESC>l
inoremap kj <ESC>l
inoremap <ESC> <NOP>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Enable h,j,k,l navigation while in insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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

" TMUX-like window creation mappings
noremap <C-w>% :vnew<CR>
noremap <C-w>" :new<CR>

" Put current line to center of screen after scrolling down
nnoremap <C-d> <C-d>zz

" Delete current line without leaving insert mode
inoremap <C-d> <esc>ddi

" Autoclose parentheses, brackets and quotes
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

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

" Save current file with ,w instead of typing :w every time
nnoremap <leader>w :w!<CR>

" Quit current file with ,q instead of typing :q every time
nnoremap <leader>q :q<CR>

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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Symbol renaming
nnoremap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nnoremap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nnoremap <leader>qf  <Plug>(coc-fix-current)

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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
let g:go_auto_sameids = 1
let g:go_updatetime = 250
hi def goSameId ctermbg=18 ctermfg=white

" Set vim-go snippet engine
let g:go_snippet_engine = "ultisnips"

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<Enter>"                                            
let g:UltiSnipsJumpForwardTrigger="<TAB>"                                       
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" Mappings for vim-fugitive:
nnoremap <C-g>st :Git status<CR>
nnoremap <C-g>a :Git add -A<CR>
nnoremap <C-g>m :Git commit<CR>
nnoremap <C-g>u :Git push<CR>
nnoremap <C-g>d :Git pull<CR>
nnoremap <C-g>f :Git fetch<CR>
nnoremap <C-g>ff :Git diff<CR>
nnoremap <C-g>w :.GBrowse<CR>

" Mappings for vim-gitgutter:
nnoremap <C-g>j <Plug>(GitGutterNextHunk)
nnoremap <C-g>k <Plug>(GitGutterPrevHunk)
nnoremap <C-g>hs <Plug>(GitGutterStageHunk)
nnoremap <C-g>hu <Plug>(GitGutterUndoHunk)
nnoremap <C-g>hp <Plug>(GitGutterPreviewHunk)

" Settings for 'APZelos/blamer.nvim':
let g:blamer_enabled = 1
let g:blamer_delay = 500

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

noremap <C-Space>j :Autoformat json<CR>
autocmd FileType json :Autoformat json

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

let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1

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
