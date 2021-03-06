syntax on

" Change map leader to something I remember
let mapleader=','

" Vundle junk
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'dracula/vim', { 'name': 'dracula' }
call vundle#end()
filetype plugin indent on

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

" Toggle NERDTree file browser
map <leader>n :NERDTreeToggle<cr>

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

" Folding maps
nnoremap <space> za
vnoremap <space> zf

" Make sure we can scroll in screen, but no mouse nav
if &term == "screen"
" set mouse=a
  set ttymouse=xterm2
endif 

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Set ruby compiler
autocmd FileType ruby compiler ruby
autocmd FileType ruby map <F9> :!ruby "%:p"<CR>

" Some tricks for mutt
" F1 through F3 re-wraps paragraphs in useful ways
autocmd FileType mail set spell
autocmd FileType mail set textwidth=80
autocmd FileType mail set columns=80

" Open links in browser
function! Browser ()
  let line = getline (".")
  let line = matchstr (line, "\(https?://\|www\.\)[^ ,;\t]*")
  exec "!google-chrome " . line
endfunction
map <Leader>f :call Browser ()<CR>

" Printing
set printoptions=paper:letter,duplex:off

" Get some nice indenting controlled by filetype
if has("autocmd")
	set noautoindent
	set nocindent
	set nosmartindent
	filetype plugin indent on
endif

" set the colorscheme
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None
