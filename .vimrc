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
set nowrap
set numberwidth=5

au Filetype pandoc set wrap tw=80

"""
" Plugs
"""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'relastle/bluewery.vim'
Plug 'alvan/vim-closetag'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'wincent/command-t'
Plug 'ryanoasis/vim-devicons'
Plug 'matze/vim-move'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'nikvdp/ejs-syntax'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'dag/vim-fish'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'flrnd/candid.vim'
Plug 'mhinz/vim-signify'
Plug 'davisdude/vim-love-docs', { 'branch': 'build' }
Plug 'neowit/vim-force.com'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()            " required
filetype plugin indent on    " required
"syntax enable

"	Themes and colors
colorscheme monokai-bold
hi Normal guibg=NONE ctermbg=NONE 
hi Visual ctermfg=255 guifg=#eeeeee ctermbg=36  guibg=#875f87
highlight CursorLine ctermbg=23 ctermfg=NONE
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

" Open help and help files in a new tab
:cabbrev help tab help

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
"
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
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx,*.md'

"""
"" vim-force.com
"""
let g:apex_workspace_path="/home/michelkazi/.apex/workspace"
let g:apex_backup_folder="/home/michelkazi/.apex/backup"
let g:apex_temp_folder="/home/michelkazi/.apex/temp"
let g:apex_tooling_force_dot_com_path="/home/michelkazi/.apex/tooling-force.com-0.4.7.0.jar"
let g:apex_properties_folder="/home/michelkazi/.apex/properties"
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
"" Command-T
"""
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
