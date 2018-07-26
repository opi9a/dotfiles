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
Plug 'vim-scripts/indentpython.vim'
Plug 'fenetikm/falcon'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'    " 
Plug 'tpope/vim-commentary'  " comment out lines: use gc 
Plug 'tpope/vim-surround'    " cs (chg) ds (del) ys (add)
Plug 'tpope/vim-repeat'      " makes other plugs repeat
Plug 'tpope/vim-fugitive'    " 
Plug 'tommcdo/vim-exchange'  " swap words: cx
Plug 'tommcdo/vim-lion'      " align lines based on a char: gl
Plug 'nathanaelkane/vim-indent-guides' " highlight indents: <leader>ig
Plug 'wellle/targets.vim'    " act on parens etc
Plug 'arcticicestudio/nord-vim'
Plug 'davidklsn/vim-sialoquent'
Plug 'machakann/vim-highlightedyank'
Plug 'wikitopian/hardmode'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'

" FILESYSTEM
" Plug 'scrooloose/nerdtree'
" Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-vinegar'     " file system

" CODE COMPLETION
" Tried
" - jedi (works but slow - because sync - and messy)
" - YouCompleteMe (didn't work with pandas, sync)
" - deoplete (fast and cool but wont work with pandas) 
if has('nvim')
    Plug 'roxma/nvim-completion-manager'
 else
    Plug 'maralla/completor.vim'
endif

" 
" Keep jedi as it has other uses, eg <leader>d 
Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0  " - to turn it off

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
au BufRead,BufNewFile *.js match BadWhitespace /\s\+$/
au         BufNewFile *.js set fileformat=unix
au BufRead,BufNewFile *.js let b:comment_leader = '//'


" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=4
au BufRead,BufNewFile *.html set softtabstop=4
au BufRead,BufNewFile *.html set shiftwidth=4
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
    \ set fileformat=unix 

" let python_highlight_all=1


" ------------
" KEY MAPPINGS
" ------------

nnoremap ; :
nnoremap : ;
 

" search within current viewport, either direction
nnoremap <silent> z/ :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=1<CR>``/\%V

" toggle relative numbers
noremap <leader>r :set relativenumber!<CR>

" close buffer without losing split
command! Bd bp|bd #

if has('nvim')
  "Leave terminal mode
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  

  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " ..insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " ..visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " ..normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l

endif


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
set textwidth=0       " turns off breaking lines (with an EOL)
set scrolloff=4       " scroll before cursor hits end of screen
set fo-=t             " formatoptions.  Stops auto processing.

" set list              " show non whitespace
" set listchars=tab:▸\ ,eol:¬

" GENERAL DISPLAY
set showcmd	      " display incomplete commands

" SEARCH
syntax on             " syntax highlighting on
set hlsearch          " highlight last used search pattern
if (has('nvim'))
    set inccommand=nosplit
endif

" EASYMOTION MAPPINGS
" - f is all-purpose single char jump
" - works as a motion for operations (automatically stays in buffer)
" - works over multiple buffers for just jumping (because nmap)
map  ,f <Plug>(easymotion-bd-f)
nmap ,f <Plug>(easymotion-overwin-f)

" two character variants - single buffer
nmap ,s <Plug>(easymotion-s2)
" NB t just places cursur before target
nmap ,T <Plug>(easymotion-t2)

" lines
map  ,l <Plug>(easymotion-bd-jk)
nmap ,l <Plug>(easymotion-overwin-line)

" words
map  ,w <Plug>(easymotion-bd-w)
nmap ,w <Plug>(easymotion-overwin-w)

" x
map \h <Plug>(easymotion-linebackward)
map \j <Plug>(easymotion-j)
map \k <Plug>(easymotion-k)
map \l <Plug>(easymotion-lineforward)

" remap comma
map # ,

" old stuff
" map / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map n <Plug>(easymotion-next)
" map N <Plug>(easymotion-prev)

" OTHER 
set foldmethod=indent " enable folding
set foldlevel=99      " 
set mouse=a           " activate mouse


"----------------------
" COLORs AND FORMATTING
"----------------------
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 else
    set termguicolors
endif

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='hard'
" colorscheme default
call togglebg#map("<F5>")

"Fine-tuning
" highlight LineNr ctermfg=240 ctermbg=NONE
" " monokai defaults are 231 / 235
" " but these are really the best.  188 and 233
" highlight Normal ctermfg=188 ctermbg=233 highlight Comment cterm=italic ctermfg=240
highlight Comment cterm=italic

if has("gui_running")
    if has("gui_gtk2")
        set guifont=FantasqueSansMono\ 14
    endif
endif

" set a left margin (good if not using line numbers)
set foldcolumn=2
highlight FoldColumn ctermbg=bg ctermfg=bg

" make the 79th col show when lines get too long - as this will if I type enough
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%79v', 100)

" cleanly turn on light background
noremap <leader>B :set background=light \|
                  \ highlight FoldColumn ctermbg=bg ctermfg=bg
                  \ <CR>
                  \ :set nohlsearch <CR>

"-----------------
" NOTES AND ERRATA
"-----------------

" To get color palette run: so ~/.vim/color_demo.vim
" Solarized slatey background is #0
" Nice foreground for main text is #188

