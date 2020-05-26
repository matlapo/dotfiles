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
"Plug 'plasticboy/vim-markdown'
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

set background=dark
let base16colorspace=256
colorscheme base16-bright
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


" coc configs
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
