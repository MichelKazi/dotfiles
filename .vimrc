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

"""
" Plugs
"""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine', {'for': ['python', 'yaml']}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'flrnd/candid.vim'
"Plug 'nathanaelkane/vim-indent-guides', {'for': ['python', 'yaml']}
Plug 'andrewstuart/vim-kubernetes', {'for': 'yaml'}
Plug 'Rigellute/rigel'
Plug 'simeji/winresizer'
Plug 'alvan/vim-closetag', {'for': ['html', 'xml','javascriptreact']}
Plug 'ryanoasis/vim-devicons'
Plug 'matze/vim-move'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax' , {'for': 'markdown'}
Plug 'tpope/vim-surround'
"Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'yuezk/vim-js', {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty', {'for': 'javascriptreact'}
Plug 'mhinz/vim-signify'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'rust-lang/rust.vim', {'for': 'rust'}

call plug#end()            " required
filetype plugin indent on    " required
syntax enable

let g:python_host_prog = 'usr/local/bin/python3'
" ----- FUNCTIONS ------------------------------------------------------------


" ----- THEMES AND COLORS ----------------------------------------------------
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"colorscheme kuroi
"colorscheme xcodedark
"colorscheme rigel
"colorscheme nightfly
"colorscheme candid
"colorscheme onedark
set bg=dark
colorscheme gruvbox

set fillchars+=vert:│ " Thinner lines for vsplits
set cc=100

" XCODEDARK
"hi Normal guibg=NONE ctermbg=NONE
"hi Visual ctermfg=255 guifg=#eeeeee ctermbg=36  guibg=#875f87
"hi CursorLine ctermbg=89 ctermfg=NONE guibg=#40313d
"hi Comment cterm=NONE guibg=NONE ctermfg=138 guifg=#4C8273
"hi CursorLineNr cterm=bold ctermfg=168 gui=NONE guifg=#fe79b1

" NIGHTFLY
hi VertSplit guifg=#ff9000 guibg=NONE ctermbg=NONE 
"hi string guifg=#ff6f98 ctermfg=48
"" ---A prettier orange ---
"hi Title guifg=#f7a100 cterm=bold 
"hi StorageClass guifg=#f7a100
"hi Constant guifg=#f7a100
"hi NonText guifg=#f7a100

" CANDID
"hi CursorLineNr cterm=bold ctermfg=168 gui=NONE guifg=#fe79b1
"hi Comment cterm=NONE guibg=NONE ctermfg=138 guifg=#4C8273
"hi ColorColumn guibg=#383d3d guifg=#ffffff

" ----- REMAPS ---------------------------------------------------------------
map q: <Nop>
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
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

" leader yank to buffer
vnoremap <Leader>y "+y
vnoremap <Leader>x "+x
vnoremap <Leader>d "+d
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>Y "+Y
nnoremap <Leader>yy "+yy
nnoremap <Leader>x "+x
nnoremap <Leader>dd "+dd
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Open help and help files in a new tab
:cabbrev help tab help
:cabbrev vsrc vsp ~/dotfiles/.vimrc
:cabbrev df SignifyDiff

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

" ----- COOL FUNCTIONS AND SHIT-----------------------------------------------
autocmd! bufwritepost .vimrc source %

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ----- PLUGIN CONFIGURATIONS ------------------------------------------------
"""
" COC
""" 

"""
" vim-move
"""
let g:move_key_modifier = 'S'

"""
" vim-indent-guides
"""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
augroup indentguidesfiletype
  au BufRead,BufNewFile,VimEnter,Colorscheme *.py :hi IndentGuidesOdd guibg=#003845
  au BufRead,BufNewFile,VimEnter,Colorscheme *.py :hi IndentGuidesEven guibg=#002a45

  au BufRead,BufNewFile,VimEnter,Colorscheme *.yaml :hi IndentGuidesOdd guibg=#003845
  au BufRead,BufNewFile,VimEnter,Colorscheme *.yaml :hi IndentGuidesEven guibg=#002a45

  au BufRead,BufNewFile,VimEnter,Colorscheme *.yml :hi IndentGuidesOdd guibg=#003845
  au BufRead,BufNewFile,VimEnter,Colorscheme *.yml :hi IndentGuidesEven guibg=#002a45
augroup END

let g:indentLine_setColors = 0
let g:indentLine_char = ''
"""
" Lightline
"""
let g:lightline = { 
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
      \ },
      \ 'component_function': {
      \ 'gitbranch': 'gitbranch#name'
      \   },
      \ }
let g:lightline.separator = {
      \   'left': '', 'right': ''
      \}
let g:lightline.subseparator = {
      \   'left': '', 'right': ''
      \}
set noshowmode

"""
" Vim-signify
"""
let g:signify_sign_add = ''
let g:signify_sign_delete = ''
let g:signify_sign_change = ''

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
set completeopt-=preview

"""
"	ALE Config
"""
let g:ale_sign_error = '👺'
let g:ale_sign_warning = '😰'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fixers = {
      \  'javascript': ['eslint'],
      \  'python': ['autopep8']
      \}
let g:ale_fix_on_save = 1

"""
"	NERDTree
"""
let g:NERDTreeShowLineNumbers=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"""
"	Pandoc
"""
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let g:pandoc#syntax#conceal#use=1
let g:pandoc#syntax#conceal#urls=1

"""
" Vim Fugitive
"""
" Fugitive Conflict Resolution
nmap <leader>gs :G<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gh :diffget //2<CR>
nnoremap gu :diffget //3<CR>

"""
"" Go
"""
let g:go_fmt_command="goimports"
let g:go_fmt_autosave=1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

"""
" Rust
"""
let g:rustfmt_autosave = 1

"""
" COC
"" GoTo code navigation.
nmap <silent> <leader>gt :vsp<CR><Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)""

"""
" YouCompleteMe
"""
"nnoremap <leader>gt :vsplit \| YcmCompleter GoTo<CR>
"nnoremap <leader>gtt :tab \| YcmCompleter GoTo<CR>

"""
" Highlight TODO, FIXME, NOTE, etc.
"""
if has('autocmd') && v:version > 701
  augroup todo
    autocmd!
    autocmd Syntax * call matchadd(
          \ 'Debug',
          \ '\v\W\zs<(NOTE|INFO|IDEA|TODO|FIXME|CHANGED|XXX|BUG|HACK|TRICKY)>'
          \ )
  augroup END
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.tmpl    setfiletype template
  au! BufRead,BufNewFile .tmux.conf.local setfiletype tmux
augroup END

"""
" LeaderF
"""
let g:Lf_WindowPosition = 'popup'
