" ----- REMAPS ---------------------------------------------------------------
map q: <Nop>
map <C-n> :NERDTreeToggle %<CR>
"map <C-n> :CocCommand explorer<CR>
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

