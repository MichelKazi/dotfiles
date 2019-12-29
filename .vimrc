filetype plugin indent on

set nocompatible              " be iMproved, required
set nofoldenable
set nospell
set softtabstop=2
set sw=2
set ts=2
set cursorline
set number
set relativenumber
set shell=sh
set laststatus=2
set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
set nowrap

" Plugins
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'matze/vim-move'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'nikvdp/ejs-syntax'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dense-analysis/ale'
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


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

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

""""""
"""	plugin configurations
""""""

"""
" Airline
"""
let g:airline_powerline_fonts = 1



let g:move_key_modifier = 'C'

"""
"	Ultisnip
"""

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""
"	ALE Config
"""

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠️'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

"""
"	NERDTree
"""

let g:NERDTreeShowLineNumbers=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup pandoc_syntax
		au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

"""
"Gitgutter
"""
let g:gitgutter_async=0
