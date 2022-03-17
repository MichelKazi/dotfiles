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
set rtp +=~/.vim
let &rtp.=',' . expand("$HOME") . '/.config/nvim'

" ----- PLUGIN CONFIGURATIONS ------------------------------------------------
source ~/dotfiles/nvim/.config/nvim/plugins.vim

" ----- THEMES AND COLORS ----------------------------------------------------
source ~/dotfiles/nvim/.config/nvim/colors.vim

" ----- REMAPS ---------------------------------------------------------------
source ~/dotfiles/nvim/.config/nvim/mappings.vim

" ----- COOL FUNCTIONS AND SHIT-----------------------------------------------
source ~/dotfiles/nvim/.config/nvim/functions.vim

lua require('michelkazi')
