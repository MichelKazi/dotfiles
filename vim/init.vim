"""
" shell config 
"""
if &shell =~# 'fish$'
  set shell=sh
endif
set nocompatible
set nofoldenable
set nospell
set softtabstop=2
set sw=2
set ts=2
set expandtab
set cursorline
set number
set relativenumber
set shell=sh
set laststatus=2
set t_Co=256
set encoding=UTF-8
set nowrap
set numberwidth=5
set incsearch
set splitbelow
set splitright
set guicursor=i:ver25-iCursor
set backspace=indent,eol,start
set lazyredraw
let mapleader=","

"""
" File find
"""
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/venv/**
set wildignore+=**/env/**
set wildignore+=**/__pycache__/**
set wildignore+=**.pyc
let g:python_host_prog = '/usr/bin/python'

" ----- PLUGIN CONFIGURATIONS ------------------------------------------------
source ~/dotfiles/vim/plugins.vim

" ----- THEMES AND COLORS ----------------------------------------------------
source ~/dotfiles/vim/colors.vim

" ----- REMAPS ---------------------------------------------------------------
source ~/dotfiles/vim/mappings.vim

" ----- COOL FUNCTIONS AND SHIT-----------------------------------------------
source ~/dotfiles/vim/functions.vim

