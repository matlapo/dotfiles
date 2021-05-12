
let mapleader = "\<Space>"

" plugins
call plug#begin()

" workflow improvements
Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-peekaboo'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" fuzzy finding
"Plug 'airblade/vim-rooter'
Plug 'srstevenson/vim-picker'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" base16 plugin
Plug 'chriskempson/base16-vim'

" syntax support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'

call plug#end()

syntax on

" lightline
" stolen from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" access colors present in 256 colorspace
let base16colorspace=256

colorscheme base16-summerfruit-dark

set termguicolors

" use system clipboard
set clipboard=unnamed

nmap <leader>; :Buffers<CR>
set cmdheight=2

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

" Search configuration.
set gdefault " Enable global substitute (all matches in a line are substituted).
set hlsearch " Highlight search matches.
set incsearch " Enable incremental search.

" set tab to be 4 characters
set tabstop=4

" >> and friends indent by 4 characters
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" case-insensitive search with /
set ignorecase

" search as I type
set incsearch

" remove all highlight
map <silent> <leader><cr> :noh<cr>

inoremap jk <esc>

" jump to start and end of line using the home row keys
map H ^
map L $

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

nmap <leader>o <Plug>(PickerEdit)
nmap <leader>pv <Plug>(PickerVsplit)

