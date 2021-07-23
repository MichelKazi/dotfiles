" ----- THEMES AND COLORS ----------------------------------------------------
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
let g:gruvbox_material_background='hard'

colorscheme gruvbox-material

set fillchars+=vert:│ " Thinner lines for vsplits
set cc=100

hi Comment cterm=NONE guibg=NONE ctermfg=138 guifg=#566663

hi VertSplit guifg=#ff9000 guibg=NONE ctermbg=NONE 
hi CursorLineNr guibg=#ffce1c guifg=#000000 cterm=BOLD

