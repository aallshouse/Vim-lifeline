set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

call pathogen#infect()
syntax on
filetype plugin indent on

set noswapfile
set backupdir=C:\Temp\Vim
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list " show trailing whitespace and tabs
set	shiftwidth=2
set tabstop=2
set ignorecase
set number
set	smartindent
set	expandtab

if has("gui_running")
  set guifont=Consolas:h9:cANSI
  set lines=40       " height = # lines
  set columns=175        " width = # columns
  set background=light   " adapt colors for background
endif

" Keyboard mappings
let mapleader = ","

map <leader><left> :bp<CR>
map <leader><right> :bn<CR>
nmap <leader>, <C-W><left>
nmap <leader>. <C-W><right>
map <leader>e :e C:\Program Files (x86)\Vim\_vimrc<CR>
map <leader>u :source C:\Program Files (x86)\Vim\_vimrc<CR>:noh<CR>
nmap <leader>f :FufCoverageFile<CR>
nmap <leader>r :FufRenewCache<CR>
nmap <leader>d :FufDir<CR>
nmap <leader>w :w!<CR>
nmap <leader>t :retab<CR>
nmap <leader>n :noh<CR>
nmap <leader>v <C-W>v<CR>
nmap <leader>q <C-W>q<CR>

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colors wombat2