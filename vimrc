set nocompatible

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'Raimondi/delimitMate'
Plug 'lukerandall/haskellmode-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'rust-lang/rust.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'dag/vim2hs'
Plug 'w0ng/vim-hybrid'
Plug 'hallison/vim-markdown'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" plugin keybindings
noremap <F8> :TagbarToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
nnoremap <leader>, :CtrlP<cr>
nnoremap <leader>. :CtrlPTag<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("syntax")
  syntax on
endif

if has("autocmd")
  " jump to last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " load indentation rules/plugins according to detected filetype
  filetype plugin indent on
endif


let c_space_errors = 1
set ai 				         " Autoindent
set backspace=indent,eol,start

set ignorecase        		 " Do case insensitive matching
set smartcase		    	 " Do smart case matching
set incsearch     	         " Incremental search

set hidden            		 " Hide buffers when they are abandoned
set autoread	      		 " watch for file changes

set tabstop=4
set shiftwidth=4
set expandtab 			     " Convert tabs to spaces

set undofile
set undodir=~/.vim/undodir

let g:haddock_browser = "/usr/bin/firefox"
au Bufenter *.hs compiler ghc

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1

" Highlight current line
" set cul
hi CursorLine term=none cterm=none ctermbg=0

:set t_Co=256 				 " 256 color palletes
 colorscheme bensday
" colorscheme desertEx
set background=dark
:highlight Normal ctermfg=white ctermbg=black
" colorscheme hybrid

set showcmd           		 " Show (partial) command in status line.
set ruler 			         " Show location in file
set number 			         " Show line numbers
set relativenumber
"set hlsearch 			     " Highlight matches
set showmatch         		 " Show matching brackets.
set mousehide 			     " Don't show mouse while typing
set antialias 			     " Antialias fonts
set wildmenu
set wildmode=longest,list,full
