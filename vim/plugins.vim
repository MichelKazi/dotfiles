" ----- PLUGIN CONFIGURATIONS ------------------------------------------------

"""
" Plugs
"""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'wadackel/vim-dogrun'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'Yggdroot/indentLine', {'for': ['python', 'yaml']}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {
      \'branch': 'release',
      \'do': 'CocInstall coc-rls coc-go coc-python coc-json coc-fish coc-clangd coc-vimlsp coc-explorer coc-snippets'
      \}
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
Plug 'editorconfig/editorconfig-vim'

call plug#end()            " required
filetype plugin indent on    " required
syntax enable

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
      \ 'colorscheme': 'dogrun',
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
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
"""
" coc_config_directory
let g:coc_config_home = '~/dotfiles/vim/coc'
"GoTo code navigation.
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
