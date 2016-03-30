set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-abolish'
Plugin 'thoughtbot/vim-rspec'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fugitive.vim'
Plugin 'Solarized'
Plugin 'chase/vim-ansible-yaml'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/syntastic'
Plugin 'closetag.vim'
Plugin 'cohama/lexima.vim'

call vundle#end()
filetype plugin indent on

let mapleader=" "

runtime macros/matchit.vim

set relativenumber
set number
nnoremap <Leader>n :set number! relativenumber!<CR>


set ruler
set showmode
set showcmd
set cursorline

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

" Ensure vim is picking up the right pallet options
set t_Co=256

" Try out solarized because lots of people rave about it?
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

highlight CursorLine   cterm=underline term=underline ctermbg=NONE guibg=NONE

"
" sensible vim settings
"

" Make backspace behave normally
set backspace=indent,eol,start
  
" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
" Turn off highlighting after a search
nmap <leader>h :nohlsearch<cr>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" HT: https://upcase.com/videos/onramp-to-vim-plugins
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
" Switch to a file it already open
" HT: https://github.com/adarsh/dotfiles/blob/master/vim/ctrlp.vim
let g:ctrlp_switch_buffer = 'E'

" RSpec.vim mappings
function! RubyLeaderMappings()
  nnoremap <Leader>t :wa<CR> :call RunCurrentSpecFile()<CR>
  nnoremap <Leader>s :wa<CR> :call RunNearestSpec()<CR>
  nnoremap <Leader>l :wa<CR> :call RunLastSpec()<CR>
  nnoremap <Leader>a :wa<CR> :call RunAllSpecs()<CR>
endfunction

" PHPUnit Mappings
" Copy all the Ruby Test Mappings To Run PHPUnit
function! PHPLeaderMappings()
  nnoremap <Leader>t :wa<CR> :call RunPHPUnitOnThisFileInVagrant()<CR>
  nnoremap <Leader>s :wa<CR> :call RunPHPUnitOnThisFileInVagrant()<CR>
  nnoremap <Leader>l :wa<CR> :call RunPHPUnitInVagrant()<CR>
  nnoremap <Leader>a :wa<CR> :call RunPHPUnitInVagrant()<CR>
endfunction

function! RunPHPUnitOnThisFileInVagrant()
  silent !clear
  execute "!vagrant ssh -c 'cd /vagrant; phpunit " . expand("%") . "'"
endfunction

function! RunPHPUnitInVagrant()
  silent !clear
  execute "!vagrant ssh -c 'phpunit'"
endfunction


" Make pasting code simpler
map <Leader>p "*p<CR>

autocmd filetype php call PHPLeaderMappings()
autocmd filetype ruby call RubyLeaderMappings() 

" vim-airline statusbar config
set laststatus=2

" Better window/split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_html_validator_exec = 'tidy5'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = '--config ~/.jshintrc'
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

map <leader>e :SyntasticReset<CR>

" Folding
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

let g:lexima_enable_endwise_rules = 1
call lexima#add_rule({'char': "<bar>", 'input_after': "<bar>", 'filetype': 'ruby'})


" Create dirs when saving
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Automatically remove whitespace at end of lines
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType php,ruby,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
