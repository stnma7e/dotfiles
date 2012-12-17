call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

" highlight current line
set cul
hi CursorLine term=none cterm=none ctermbg=0

" line enables syntax highlighting by default.
if has("syntax")                                                          
  syntax on
endif

" jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules/plugins according to detected filetype
if has("autocmd")
  filetype plugin indent on
endif

set showcmd           		 " Show (partial) command in status line.
set showmatch         		 " Show matching brackets.
set ignorecase        		 " Do case insensitive matching
set smartcase				 " Do smart case matching
set incsearch     		     " Incremental search
set autowrite        		 " Automatically save before commands like :next and :make
set hidden            		 " Hide buffers when they are abandoned
set mouse=a           		 " Enable mouse usage (all modes)
set autoread	      		 " watch for file changes
set number	      			 " line numbers
set autoindent smartindent	 " auto/smart indent
set tabstop=4

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" set colorscheme
colorscheme dasch

" open tagbar
nmap <F8> :TagbarToggle<CR>
