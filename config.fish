status --is-interactive; and source (rbenv init -|psub)
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

source /home/michelkazi/.config/fish/passwords.fish


alias javacall='javac *.java'
alias learnshit='cd ~/Documents/education'
alias yearup='cd ~/Documents/education/YearUp'
alias docs='cd ~/Documents'
alias py3='python3'
alias npmfix='npm audit fix'
alias ls='exa'
alias projects='cd ~/projects'
alias ckitty='vim ~/dotfiles/kitty.conf'
alias back='cd -'
alias ex='exit'
alias ga='git add .'
alias vi='vim'
alias ivrc='vim ~/.ideavimrc'
alias vrc='vim ~/dotfiles/.vimrc'
alias dotfiles='cd ~/dotfiles'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias ..='cd ..'
alias ctmux='vim ~/dotfiles/.tmux.conf.local'
alias cfish='vim ~/dotfiles/config.fish'
alias :wq='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'

source ~/.config/fish/functions/bobthefish_colors.fish

test -s /home/michelkazi/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish


set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  
export TERM=xterm-256color
