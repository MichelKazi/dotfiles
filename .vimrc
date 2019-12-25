filetype plugin indent on

set nocompatible              " be iMproved, required
set clipboard=unnamedplus
set nofoldenable
set nospell
set softtabstop=2
set sw=2
set ts=2
set cursorline
set number
set shell=sh
set rtp+=/home/michelkazi/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
set nowrap

" Plugins
call vundle#begin()

Plugin 'dag/vim-fish'
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

call vundle#end()            " required
filetype plugin indent on    " required

"	Themes and colors
colorscheme monokai-bold
hi Normal guibg=NONE ctermbg=NONE 
hi Visual ctermfg=255 guifg=#eeeeee ctermbg=96  guibg=#875f87


"	Remaps
map q: <Nop>
map <C-n> :NERDTreeToggle<CR>
noremap <up>    :echom 'STUPID. USE K TO GO UP'<CR>
noremap <down>  :echom 'STUPID. USE J TO GO DOWN'<CR>
noremap <left>  :echom 'STUPID. USE H TO GO LEFT'<CR>
noremap <right> :echom 'STUPID. USE L TO GO RIGHT'<CR>
nnoremap Q <nop>
nnoremap <leader>nt :call NumberToggle()<cr>
inoremap <up>    <ESC>:echom 'STUPID. USE K TO GO UP'<CR> 
inoremap <down>  <ESC>:echom 'STUPID. USE J TO GO DOWN'<CR>
inoremap <right> <ESC>:echom 'STUPID. USE L TO GO RIGHT'<CR>
inoremap <left>  <ESC>:echom 'STUPID. USE H TO GO LEFT'<CR>    

"	Macros
let @j = '0i//j0' 
let @u = '0xxj0'

"	Cool functions and shit
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

"	"	plugin configurations

let g:NERDTreeShowLineNumbers=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup pandoc_syntax
		au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

