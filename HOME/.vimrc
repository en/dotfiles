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

set nobackup
set noswapfile
set nu

let g:netrw_list_hide = '\.pyc$'

let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'ap/vim-buftabline'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'stephpy/vim-yaml'

" Add plugins to &runtimepath
call plug#end()

" dracula/vim
color dracula

" ap/vim-buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1

" majutsushi/tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

" mileszs/ack.vim
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading'
  let g:ack_autoclose = 1
  nnoremap <Leader>/ :Ack!<Space><C-R>=expand('<cword>')<CR><CR>
endif

" rust-lang/rust.vim
let g:rustfmt_autosave = 1

" racer-rust/vim-racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
