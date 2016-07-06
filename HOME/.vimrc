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
  " Remember the positions in files with some git-specific exceptions"
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")
    \           && expand("%") !~ "COMMIT_EDITMSG"
    \           && expand("%") !~ "ADD_EDIT.patch"
    \           && expand("%") !~ "addp-hunk-edit.diff"
    \           && expand("%") !~ "git-rebase-todo" |
    \   exe "normal g`\"" |
    \ endif
  " Shebang line automatically generated
  augroup Shebang
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
  augroup END
endif " has("autocmd")

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set hls
set nu
set noswapfile
set noesckeys

let g:netrw_fastbrowse = 2
let g:netrw_list_hide = '\.pyc$,\.swp$'

" /etc/vimrc ends here
