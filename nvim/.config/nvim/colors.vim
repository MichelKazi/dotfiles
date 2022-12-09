" ----- THEMES AND COLORS ----------------------------------------------------
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" let g:gruvbox_material_background='hard'
" colors deus
" set background=dark
" colors gruvbox

set fillchars+=vert:│ " Thinner lines for vsplits
" set cc=100

" hi Comment cterm=NONE guibg=NONE ctermfg=138 guifg=#566663
hi CocUnusedHighlight guifg=#a2b3b2
hi VertSplit guifg=#ff9000 guibg=NONE ctermbg=NONE 
" hi CursorLineNr guibg=#ffce1c guifg=#000000 cterm=BOLD

" Example config in VimScript
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
" colorscheme tokyonight
" Currently loading thru colors.lua
