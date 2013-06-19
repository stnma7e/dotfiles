call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" plugin keybindings
noremap <F8> :TagbarToggle<CR>

" personal custom commands
:command NScim !ninja -C ~/scim/build
:command RScim !cd ~/scim/build/intern; ./exscim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbrev bcode \begin{code}<cr><cr>
iabbrev ecode \end{code}<cr><cr>

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
set nocompatible 			 " Use Vim settings instead of vi
set ai 						 " Autoindent

set ignorecase        		 " Do case insensitive matching
set smartcase				 " Do smart case matching
set incsearch     		     " Incremental search
set hlsearch 				 " Highlight matches

set autowrite        		 " Automatically save before commands like :next and :make

set hidden            		 " Hide buffers when they are abandoned
set autoread	      		 " watch for file changes

set softtabstop=2 			 " Tabs are 2 spaces long
set shiftwidth=2
set expandtab 				 " Convert tabs to spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight current line
" set cul
" hi CursorLine term=none cterm=none ctermbg=0

:set t_Co=256 				 " 256 color palletes
" colorscheme bensday
colorscheme desertEx
set background=dark

if has("gui_running")
  set guifont=Inconsolata-g\ 7
endif

set showcmd           		 " Show (partial) command in status line.
set ruler 					 " Show location in file
set number 					 " Show line numbers
set showmatch         		 " Show matching brackets.
set mousehide 				 " Don't show mouse while typing
set antialias 				 " Antialias fonts
set wildmenu
set wildmode=longest,list,full

