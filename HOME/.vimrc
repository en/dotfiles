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

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'mileszs/ack.vim'

" Add plugins to &runtimepath
call plug#end()

color dracula
set nobackup
set noswapfile
set nu

let g:netrw_list_hide = '\.pyc$'

let mapleader = "\<Space>"

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading'
  nnoremap <Leader>/ :Ack<Space><C-R>=expand('<cword>')<CR><CR>
endif
