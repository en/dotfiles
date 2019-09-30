" Required for operations modifying multiple buffers like rename.
set hidden
set nobackup
set noswapfile
set nu

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ap/vim-buftabline'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

let mapleader = "\<Space>"

let g:LanguageClient_serverCommands = {
    \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" ap/vim-buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1

" mileszs/ack.vim
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
  let g:ack_autoclose = 1
  nnoremap <Leader>/ :Ack!<Space><C-R>=expand('<cword>')<CR><CR>
endif

" rust-lang/rust.vim
let g:rustfmt_autosave = 1
