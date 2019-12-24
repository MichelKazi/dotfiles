set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jiangmiao/auto-pairs'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme monokai-bold

"	Keep terminal background color to GNOME terminal preferences even with a
"	custom theme
hi Normal guibg=NONE ctermbg=NONE 


filetype plugin indent on
set clipboard=unnamedplus
set nofoldenable
set nospell
set softtabstop=2
set sw=2
set ts=2
set cursorline

let @j = '0i//j0' 
let @u = '0xxj0'

set rtp+=/home/michelkazi/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256



let g:NERDTreeShowLineNumbers=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup pandoc_syntax
		au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

map <C-n> :NERDTreeToggle<CR>

set number
set shell=sh
