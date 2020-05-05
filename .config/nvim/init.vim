" inspirations:
" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" https://github.com/antoyo/.dotfiles/blob/master/nvim/.config/nvim/init.vim

let mapleader = "\<Space>"

" plugins
call plug#begin()

" workflow improvements
Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" fuzzy finding
Plug 'airblade/vim-rooter'
Plug 'srstevenson/vim-picker'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" base16 plugin
Plug 'chriskempson/base16-vim'

" git integration
Plug 'tpope/vim-fugitive'

" semantic support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax support
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'

call plug#end()

syntax on

" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" use autocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" use system clipboard
set clipboard=unnamed

nmap <leader>; :Buffers<CR>
set cmdheight=2

"set background=dark
"let base16colorspace=256
"colorscheme base16-bright
highlight clear SignColumn

" prompt to save file if changed
set confirm

set encoding=utf-8

" persistent undo
set undodir=~/.vimdid
set undofile

set wildmenu
set wildmode=list:longest

" easily move between previous and next buffers
nnoremap <leader>l :bnext<cr>
" map <leader>h :bprevious <cr>
nnoremap <leader>h :e#<cr>

" when changing buffer with unsaved changes, hide it instead of closing it
set hidden

" enable mouse usage
set mouse=a

" show current command on status bar
set showcmd

" show line numbers
set number

" use relative line numbers
set relativenumber

set nojoinspaces

" Search configuration.
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

" color the special keys (tabs, trailing spaces, nbsp) in red.
highlight Whitespace ctermbg=red

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

set nobackup
set noswapfile

nnoremap <leader>s :Rg<cr>
nnoremap <leader>b :Buffers<cr>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

set autoindent
set showmatch
set termguicolors

nmap <leader>o <Plug>(PickerEdit)
nmap <leader>pv <Plug>(PickerVsplit)

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" display which file currently viewed in tmux window
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
