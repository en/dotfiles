" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType python setlocal et ts=4 sw=4 sts=4 cc=80
  autocmd FileType javascript setlocal et ts=2 sw=2 sts=2

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

set nobackup
set noswapfile
set nu

let g:netrw_list_hide = '\.pyc$'

let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-buftabline'
Plug 'dracula/vim'
Plug 'majutsushi/tagbar'

" Add plugins to &runtimepath
call plug#end()

" ap/vim-buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1

" dracula/vim
color dracula

" majutsushi/tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
