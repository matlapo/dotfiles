" Plugins.
call plug#begin()
" asynchronous linting and make framework for Neovim/Vim (run async programs)
Plug 'benekastah/neomake'

" a vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" plugin for managing comments
Plug 'scrooloose/nerdcommenter'

" plugin for theme management
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" base16 plugin
Plug 'chriskempson/base16-vim'

" unclear for now if I will keep this
Plug 'preservim/nerdtree'

" plugin for :Rg
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"" language server protocol support for neovim
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fuzzy file picker
Plug 'srstevenson/vim-picker'

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
nnoremap <leader>l :bnext<cr>
" map <leader>h :bprevious <cr>
nnoremap <leader>h :e#<cr>

" when changing buffer with unsaved changes, hide it instead of closing it
set hidden

" enable mouse usage
set mouse=a

" set space as the leader key
let mapleader = "\<Space>"

" show current command on status bar
set showcmd

" highlight the active line.
"set cursorline
"highlight CursorLine ctermbg=LightGrey

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
"vnoremap jk <esc>

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

"" all installed language servers
"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['ra_lsp_server'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ }

""nnoremap <leader>cm :call LanguageClient_contextMenu()<CR>
"nnoremap <leader>gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <leader>re :call LanguageClient#textDocument_rename()<CR>

"" automatically start language servers.
"let g:LanguageClient_autoStart = 1

nnoremap <leader>s :Rg<cr>
nnoremap <leader>o :Buffers<cr>

" TESTING, MIGHT REMOVE
set autoindent
set showmatch
set termguicolors
colorscheme base16-tomorrow-night-eighties
nnoremap <leader>t :NERDTreeToggle<cr>

" coc suggested configs, MIGHT REMOVE

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" vim picker
" open file in current directory in current window
nmap <leader>pe <Plug>(PickerEdit)
" pick a file to edit in a new vertical split
nmap <leader>pv <Plug>(PickerVsplit)
