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
Plug 'editorconfig/editorconfig-vim'
Plug 'dyng/ctrlsf.vim'
" Plug 'crispgm/nvim-tabline'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
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
