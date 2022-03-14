" ----- COOL FUNCTIONS AND SHIT-----------------------------------------------

autocmd! bufwritepost *.vim source $HOME/.vimrc

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
