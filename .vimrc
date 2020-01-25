"""
" shell config 
"""

if &shell =~# 'fish$'
    set shell=sh
endif

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
set encoding=UTF-8
set rtp+=~/.vim/bundle/Vundle.vim
set nowrap
set numberwidth=5

"""
" Plugins
"""

call vundle#begin()

Plugin 'relastle/bluewery.vim'
Plugin 'alvan/vim-closetag'
Plugin 'vwxyutarooo/nerdtree-devicons-syntax'
Plugin 'wincent/command-t'
Plugin 'ryanoasis/vim-devicons'
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
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'flrnd/candid.vim'
Plugin 'mhinz/vim-signify'

call vundle#end()            " required
filetype plugin indent on    " required
"syntax enable

"	Themes and colors
colorscheme monokai-bold
hi Normal guibg=NONE ctermbg=NONE 
hi Visual ctermfg=255 guifg=#eeeeee ctermbg=36  guibg=#875f87
highlight CursorLine ctermbg=243 ctermfg=NONE
highlight Comment cterm=NONE guibg=NONE ctermfg=138


"	Remaps
map q: <Nop>
map <C-n> :NERDTreeToggle<CR>
noremap <up>    :echom 'HEY STUPID. USE K TO GO UP'<CR>
noremap <down>  :echom 'HEY STUPID. USE J TO GO DOWN'<CR>
noremap <left>  :echom 'HEY STUPID. USE H TO GO LEFT'<CR>
noremap <right> :echom 'HEY STUPID. USE L TO GO RIGHT'<CR>
nnoremap Q <nop>
nnoremap <leader>nt :call NumberToggle()<cr>
inoremap <up>    <ESC>:echom 'HEY STUPID. USE K TO GO UP'<CR> 
inoremap <down>  <ESC>:echom 'HEY STUPID. USE J TO GO DOWN'<CR>
inoremap <right> <ESC>:echom 'HEY STUPID. USE L TO GO RIGHT'<CR>
inoremap <left>  <ESC>:echom 'HEY STUPID. USE H TO GO LEFT'<CR>    


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
"	Macros
let @j = '0i//j0' 
let @u = '0xxj0'

"	Cool functions and shit
autocmd! bufwritepost .vimrc source %

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
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1



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

let g:ale_sign_error = '👺'
let g:ale_sign_warning = '😰'
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
"" Closetag
"""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
