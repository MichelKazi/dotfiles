" ----- COOL FUNCTIONS AND SHIT-----------------------------------------------

autocmd! bufwritepost *.vim source $HOME/.config/nvim/init.vim

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
