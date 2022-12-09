let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/zwift/crankset/clusters/aws-cloudbox
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 namespaces/current/kazi/sample/backend/referral-service/referral-service-security.yaml
badd +4 namespaces/current/kazi/sample/backend/referral-service/referral-service-auth-policy.yaml
badd +5 namespaces/current/kazi/sample/backend/keycloak/keycloak-realm.yaml
badd +125 namespaces/current/kazi/sample/backend/keycloak/keycloak-proxy-configmap.yaml
badd +7 namespaces/current/kazi/sample/backend/keycloak/keycloak-admin-ingress.yaml
badd +1 namespaces/current/kazi/sample/backend/keycloak/keycloak-standalone-ha-configmap.yaml
argglobal
%argdel
$argadd namespaces/current/kazi/
edit namespaces/current/kazi/sample/backend/keycloak/keycloak-standalone-ha-configmap.yaml
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt namespaces/current/kazi/sample/backend/keycloak/keycloak-realm.yaml
let s:l = 4 - ((3 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("namespaces/current/kazi/sample/backend/keycloak/keycloak-standalone-ha-configmap.yaml", ":p")) | buffer namespaces/current/kazi/sample/backend/keycloak/keycloak-standalone-ha-configmap.yaml | else | edit namespaces/current/kazi/sample/backend/keycloak/keycloak-standalone-ha-configmap.yaml | endif
if &buftype ==# 'terminal'
  silent file namespaces/current/kazi/sample/backend/keycloak/keycloak-standalone-ha-configmap.yaml
endif
balt namespaces/current/kazi/sample/backend/keycloak/keycloak-proxy-configmap.yaml
let s:l = 1 - ((0 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
wincmd =
if exists(':tcd') == 2 | tcd ~/zwift/crankset/clusters/aws-cloudbox/namespaces/current/kazi | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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
