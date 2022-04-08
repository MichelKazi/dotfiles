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
Plug 'kyazdani42/nvim-tree.lua'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'p00f/nvim-ts-rainbow'
Plug 'alexghergh/nvim-tmux-navigation'
Plug 'simeji/winresizer'
Plug 'alvan/vim-closetag', {'for': ['html', 'xml','javascriptreact', 'javascript']}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
" Plug 'matze/vim-move'
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown.pandoc'}
Plug 'vim-pandoc/vim-pandoc-syntax' , {'for': 'markdown.pandoc'}
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'yuezk/vim-js', {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty', {'for': 'javascriptreact'}
" Plug 'mhinz/vim-signify'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'editorconfig/editorconfig-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'crispgm/nvim-tabline'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Colorschemes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Lsp
Plug 'neovim/nvim-lspconfig'     
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/lua-dev.nvim'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()            " required
filetype plugin indent on    " required
syntax enable

"""
" vim-move
"""
" let g:move_key_modifier = 'S'

"""
" Lightline
"""
" let g:lightline = { 
"       \ 'colorscheme': 'tokyonight',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
"       \ },
"       \ 'component_function': {
"       \ 'gitbranch': 'gitbranch#name'
"       \   },
"       \ }
"""
" let g:lightline.separator = {
      " \   'left': '', 'right': ''
      " \}
" let g:lightline.subseparator = {
      " \   'left': '', 'right': ''
      " \}
"""
set noshowmode

"""
" Vim-signify
"""
let g:signify_sign_add = ''
let g:signify_sign_delete = ''
let g:signify_sign_change = ''

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
nnoremap <leader>gb :Git blame<CR>

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

au BufWritePost *.go :silent GoFmt

"""
" Rust
"""
let g:rustfmt_autosave = 1

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

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END


"""
" Lua Plugins
"""
lua << EOF
EOF
