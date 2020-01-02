status --is-interactive; and source (rbenv init -|psub)
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

source /home/michelkazi/.config/fish/passwords.fish

 
alias py3='python3'
alias ls='exa'
alias projects='cd ~/projects'
alias ckitty='vim ~/dotfiles/kitty.conf'
alias back='cd -'
alias ex='exit'
alias ga='git add .'
alias vi='vim'
alias vrc='vim ~/dotfiles/.vimrc'
alias dotfiles='cd ~/dotfiles'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias ..='cd ..'
alias ctmux='vim ~/dotfiles/.tmux.conf.local'
alias cfish='vim ~/dotfiles/config.fish'
alias :wq='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias :q!='echo "You\'re not using VIM, pal"'


test -s /home/michelkazi/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish


set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  
export TERM=xterm-256color
