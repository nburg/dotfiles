syntax on

" Change map leader to something I remember
let mapleader=','

" plug junk
call plug#begin()
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-dirvish'
call plug#end()

let g:ale_linters = {
\   'python': ['pylint'],
\   'ruby': ['rubocop'],
\   'yaml': ['yamllint'],
\}

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync
  \|   q
  \| endif
  \| let g:dracula_italic = 0
  \| colorscheme dracula
  \| highlight Normal ctermbg=None

" Set random options
set hlsearch
set modeline
set ruler
set noincsearch
set magic
set timeoutlen=1000
set showcmd

" Set tabs
set ts=2
set sw=2
set expandtab

" Bash like tab completion
set wildmode=longest:full
set wildmenu

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Toggle paste mode on and off
map <leader>pp :set paste!<cr>

" Toggle line numbers
map <leader>n :set number!<cr>

" Toggle line highlighting
map <leader>l :set cursorline!<cr>

" Toggle Dirvish file browser
map <leader>f :Dirvish<cr>

" Open terminal
map <leader>t :belowright terminal<cr>

" Setup mouse
map <leader>m
  \ :set mouse=n<cr>
  \ :set ttymouse=xterm2<cr>

" Set title
set title
" set titlestring=%t
let &titlestring = "vim: " . expand("%:t")

" Toggle spell check
map <leader>s :set spell!<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Password copy shortcut
map <leader>c 03WyW
set clipboard=unnamedplus

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Clear screen with ctrl-l
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Some tricks for mutt
" F1 through F3 re-wraps paragraphs in useful ways
autocmd FileType mail set spell
autocmd FileType mail set textwidth=80
autocmd FileType mail set columns=80

" Printing
set printoptions=paper:letter,duplex:off

" Get some nice indenting controlled by filetype
if has("autocmd")
	set noautoindent
	set nocindent
	set nosmartindent
	filetype plugin indent on
endif
