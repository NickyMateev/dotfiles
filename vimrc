" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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
