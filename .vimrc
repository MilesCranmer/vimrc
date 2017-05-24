set nocompatible
syntax enable
set hidden
set showmode
set wildmenu
set winaltkeys=no

" Change map leader
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Quick access to vimrc
nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>

" Map up and down keys
map j gj
map k gk

" Plugins
if filereadable($HOME.'/.vim/bundle/Vundle.vim/autoload/vundle.vim')
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'tpope/vim-fugitive'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'fholgado/minibufexpl.vim'
  Plugin 'ervandew/supertab'
  call vundle#end()
  filetype plugin indent on
endif

" Command line height
set ch=1

" Allow backspace over indent, eol, and start of insert
set backspace=2

" Status line
set laststatus=2

" Hide mouse while typing
set mousehide

" History and search
set history=100
set complete=.,w,b,t
set wrapscan
set incsearch

" Cursor line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Tab behaviour
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap

" Ruler and line number
set colorcolumn=80
set number

" Colorscheme
set background=dark
colorscheme solarized 

" Taglist
noremap <silent> <Leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 45
let Tlist_GainFocus_On_ToggleOpen= 1
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1

" NERDTree
:map <F5> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0

" Mouse
set mouse=a

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" map nerdtree to c-n, 
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Easier split navigations, resize automatically
nnoremap <C-J> <C-W><C-J><C-W>=
nnoremap <C-K> <C-W><C-K><C-W>=
nnoremap <C-L> <C-W><C-L><C-W>=
nnoremap <C-H> <C-W><C-H><C-W>=

" Split below, right instead
set splitbelow
set splitright

" Run a script in the current dir
:map <C-b> :!./run<CR>

" Set folding based on syntax
" (Python handled by SimpylFold)
set foldmethod=indent

" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                    \|    if empty(bufname('%'))
                    \|        browse confirm write
                    \|    else
                    \|        confirm write
                    \|    endif
                    \|endif
nnoremap <silent> <C-F> :<C-u>Update<CR>
:inoremap <C-F> <c-o>:Update<CR>
