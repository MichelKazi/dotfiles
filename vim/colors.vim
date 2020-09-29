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


" GRUVBOX
hi CursorLineNr guibg=#ffce1c guifg=#000000 cterm=BOLD
