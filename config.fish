status --is-interactive; and source (rbenv init -|psub)
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

source /home/michelkazi/.config/fish/passwords.fish

alias ls='exa'
alias vi='vim'
alias vrc='vim ~/dotfiles/.vimrc'
alias cfish='vim ~/dotfiles/config.fish'
alias :wq='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias :q!='echo "You\'re not using VIM, pal"'


test -s /home/michelkazi/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish


set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  
