" Plugins.
call plug#begin()
" asynchronous linting and make framework for Neovim/Vim (run async programs)
Plug 'benekastah/neomake'

" a vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" plugin for managing comments
Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" unclear for now if I will keep this
Plug 'preservim/nerdtree'

" plugin for :Rg
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" language server protocol support for neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" TODO
"
" / should map to Rg but current file only
" youcompleteme?
"
"
"

" use system clipboard
set clipboard=unnamed

" prompt to save file if changed
set confirm

" easily move between previous and next buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" when changing buffer with unsaved changes, hide it instead of closing it
set hidden

" enable mouse usage
set mouse=a

" set space as the leader key
let mapleader = "\<Space>"

" show current command on status bar
set showcmd

" highlight the active line.
set cursorline

" show line numbers
set number

" use relative line numbers
set relativenumber

" Search configuration. TODO
set gdefault " Enable global substitute (all matches in a line are substituted).
set hlsearch " Highlight search matches.
set incsearch " Enable incremental search.

" a tab is 4 characters
set tabstop=4

" >> and friends indent by 4 characters
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" case-insensitive search with /
set ignorecase

" search as I type
set incsearch

" I don't know what that does
set magic

" remove all highlight
map <silent> <leader><cr> :noh<cr>

" enable syntax highlighting
syntax on

" color the special keys (tabs, trailing spaces, nbsp) in red.
highlight Whitespace ctermbg=red

" map jk to <esc>
inoremap jk <esc>
vnoremap jk <esc>

" jump to start and end of line using the home row keys
map H ^
map L $

" trim trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" always keep a number of lines before and after the cursor
set scrolloff=10

" quickly edit this file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source this file once editing is done
nnoremap <leader>sv :source $MYVIMRC<cr>

" search for tag file in current directory, search parent directory if file
" not found
set tags=tags;/

" necessary for using Rust tags with rusty-tags (https://github.com/dan-t/rusty-tags)
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

" I find swap files annoying, use version control
set nobackup
set noswapfile

" all installed language servers
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <leader>cm :call LanguageClient_contextMenu()<CR>
nnoremap <leader>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>re :call LanguageClient#textDocument_rename()<CR>

" automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <leader>s :Rg<cr>

" TESTING, MIGHT REMOVE
set autoindent
set showmatch
