" enable syntax highlighting
syntax on

" automatically indent lines (default)
" set noautoindent

" select case-insenitiv search (not default)
" set ignorecase

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
" set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
set nocompatible

" allow backspacing over everything in insert mode 
set backspace=indent,eol,start

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
" set wildmode=longest,full

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Shebang line automatically generated
  augroup Shebang
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl>\"|$
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env sh\<nl>\"|$
  augroup END

  autocmd Filetype python setlocal cc=80

endif " has("autocmd")

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'a.vim'
Plugin 'minibufexpl.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set hls
set nu
set noswapfile
set noesckeys

let g:netrw_list_hide = '\.pyc$,\.swp$'

nnoremap <silent> <F10> :e%:h<CR>
nnoremap <F8> :TagbarToggle<CR>
