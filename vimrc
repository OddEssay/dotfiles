set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'Solarized'
Plugin 'chase/vim-ansible-yaml'
Plugin 'rizzatti/dash.vim'

call vundle#end()
filetype plugin indent on

let mapleader=" "

runtime macros/matchit.vim

set relativenumber
set number
set ruler
set showmode
set showcmd

set autoindent
set copyindent
set encoding=utf-8

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

set scrolloff=5

" Keep clutter out of the way
set backupdir=~/.tmp
set directory=~/.tmp

syntax on

" Try out solarized because lots of people rave about it?
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
colorscheme solarized


"
" sensible vim settings
"

" Make backspace behave normally
set backspace=indent,eol,start
  
" Start search before pressing enter
set incsearch

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" HT: https://upcase.com/videos/onramp-to-vim-plugins
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
" Switch to a file it already open
" HT: https://github.com/adarsh/dotfiles/blob/master/vim/ctrlp.vim
let g:ctrlp_switch_buffer = 'E'

" RSpec.vim mappings
map <Leader>t :wa<CR> :call RunCurrentSpecFile()<CR>
map <Leader>s :wa<CR> :call RunNearestSpec()<CR>
map <Leader>l :wa<CR> :call RunLastSpec()<CR>
map <Leader>a :wa<CR> :call RunAllSpecs()<CR>

" Make pasting code simpler
map <Leader>p "*p<CR>

" vim-airline statusbar config
set laststatus=2

" Better window/split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
