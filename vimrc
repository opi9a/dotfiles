" apparently need this first
set nocompatible

" -------- 
" PLUG INS
" -------- 

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" set the runtime path to include Plug and initialize
call plug#begin('~/.vim/plugged')

" ADD PLUGINS HERE..
" (run :PlugInstall and they get downloaded etc automatically)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/nerdtree'
Plug 'fenetikm/falcon'
Plug 'vim-airline/vim-airline'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-commentary'  " comment out lines, gc etc
Plug 'tommcdo/vim-exchange'  " swap words
Plug 'tommcdo/vim-lion'      " align lines based on a char
" ..TO HERE

call plug#end()

" -----------------
" FILETYPE SETTINGS 
" -----------------
"

" JS
au BufRead,BufNewFile *.js set expandtab
au BufRead,BufNewFile *.js set tabstop=4
au BufRead,BufNewFile *.js set softtabstop=4
au BufRead,BufNewFile *.js set shiftwidth=4
au BufRead,BufNewFile *.js set autoindent
au BufRead,BufNewFile *.js match BadWhitespace /\s\+$/
au         BufNewFile *.js set fileformat=unix
au BufRead,BufNewFile *.js let b:comment_leader = '//'


" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=4
au BufRead,BufNewFile *.html set softtabstop=4
au BufRead,BufNewFile *.html set shiftwidth=4
au BufRead,BufNewFile *.html set autoindent
au BufRead,BufNewFile *.html match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.html match BadWhitespace /\s\+$/
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!--'


au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 

    \ set textwidth=79 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set fileformat=unix 

let python_highlight_all=1



" ------------
" KEY MAPPINGS
" ------------

" reduce how much ctrl-u deletes
inoremap <C-U> <C-G>u<C-U>

" make folding with the spacebar
nnoremap <space> za


" ------------
" BUFFER STUFF
" ------------

set hidden       " setting to allow buffers to be managed

" this lets airline display all buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" --------
" SETTINGS
" --------


" FILE BACKUPS
if has("vms")
  set nobackup		 " don't keep a backup file, use versions instead
  set nowritebackup
else
  set backup		 " keep a backup file (restore to previous version)
  set undofile		 " keep an undo file (undo changes after closing)
endif

" TEXT SETTINGS
set wrap              " lines longer than window get wrapped in display
set linebreak         " don't break words when wrapping
set nolist            " don't show non whitespace
set textwidth=0       " turns off breaking lines (with an EOL)
set scrolloff=30      " scroll before cursor hits end of screen
set fo-=t             " formatoptions.  Stops auto processing.

" GENERAL DISPLAY
set number            " show lines
set ruler		      " show the cursor position all the time
set showcmd		      " display incomplete commands
set incsearch         " do incremental searching
set encoding=utf-8

" SEARCH
syntax on             " syntax highlighting on
set hlsearch          " highlight last used search pattern

" OTHER 
set history=200       " bigger history of commands
set backspace=indent  " allow backspace..
set backspace=eol     " ..to delete over..
set backspace=start   " ..normal stuff
set foldmethod=indent " enable folding
set foldlevel=99      " 
set mouse=a           " activate mouse


"----------------------
" COLORs AND FORMATTING
"----------------------

colorscheme gruvbox 
call togglebg#map("<F5>")

"Fine-tuning
highlight LineNr ctermfg=242 ctermbg=NONE
highlight Comment cterm=italic ctermfg=242
" monokai defaults are 231 / 235
highlight Normal ctermfg=231 ctermbg=235
