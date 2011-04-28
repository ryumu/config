set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'rails.vim'
Bundle 'ruby.vim'
Bundle 'eruby.vim'
Bundle 'coffee.vim'
Bundle 'Sass'
Bundle 'haml.zip'
Bundle 'javascript.vim'
Bundle 'css.vim'
Bundle 'css3'
Bundle 'git-commit'
Bundle 'surround.vim'
Bundle 'eregex.vim'
Bundle 'wombat256.vim'

" Tab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nocompatible
set number

syntax on

set nocompatible
filetype off
filetype indent on
filetype plugin on

set t_Co=256
set background=dark
"colorscheme wombat256mod
hi Pmenu ctermbg=4

set cmdheight=2
set laststatus=2
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]

set omnifunc=syntaxcomplete#Complete

"Ruby omni
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

