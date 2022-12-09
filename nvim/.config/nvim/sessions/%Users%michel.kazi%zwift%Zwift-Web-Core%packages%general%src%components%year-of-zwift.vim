let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/zwift/Zwift-Web-Core
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 packages/general/package.json
badd +0 packages/general/src/components/year-of-zwift/totals.jsx
badd +0 packages/general/src/components/year-of-zwift/yoz-3-card.jsx
badd +0 packages/general/src/containers/year-of-zwift-container.jsx
badd +0 yarn.lock
badd +0 app/static/images/yoz/ClimbAlpe5x.png
argglobal
%argdel
$argadd packages/general/package.json
$argadd packages/general/src/components/year-of-zwift/totals.jsx
$argadd packages/general/src/components/year-of-zwift/yoz-3-card.jsx
$argadd packages/general/src/containers/year-of-zwift-container.jsx
$argadd yarn.lock
$argadd app/static/images/yoz/ClimbAlpe5x.png
$argadd packages/general/src/components/year-of-zwift/elements/
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit packages/general/src/components/year-of-zwift/yoz-3-card.jsx
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists(fnamemodify("packages/general/src/components/year-of-zwift/yoz-3-card.jsx", ":p")) | buffer packages/general/src/components/year-of-zwift/yoz-3-card.jsx | else | edit packages/general/src/components/year-of-zwift/yoz-3-card.jsx | endif
if &buftype ==# 'terminal'
  silent file packages/general/src/components/year-of-zwift/yoz-3-card.jsx
endif
balt packages/general/package.json
let s:l = 4 - ((3 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
if exists(':tcd') == 2 | tcd ~/zwift/Zwift-Web-Core/packages/general/src/components/year-of-zwift | endif
tabnext
edit ~/zwift/Zwift-Web-Core/packages/general/src/components/year-of-zwift/totals.jsx
argglobal
2argu
balt ~/zwift/Zwift-Web-Core/packages/general/package.json
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit ~/zwift/Zwift-Web-Core/packages/general/src/components/year-of-zwift/yoz-3-card.jsx
argglobal
3argu
balt ~/zwift/Zwift-Web-Core/packages/general/package.json
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit ~/zwift/Zwift-Web-Core/packages/general/src/containers/year-of-zwift-container.jsx
argglobal
4argu
balt ~/zwift/Zwift-Web-Core/packages/general/package.json
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit ~/zwift/Zwift-Web-Core/yarn.lock
argglobal
5argu
balt ~/zwift/Zwift-Web-Core/packages/general/package.json
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit ~/zwift/Zwift-Web-Core/app/static/images/yoz/ClimbAlpe5x.png
argglobal
6argu
balt ~/zwift/Zwift-Web-Core/packages/general/package.json
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
