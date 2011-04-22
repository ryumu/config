" Tab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nocompatible
set number

syntax on

filetype on
filetype indent on
filetype plugin on

set cmdheight=2
set laststatus=2
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]

set omnifunc=syntaxcomplete#Complete

"Ruby omni
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

call pathogen#runtime_append_all_bundles()
