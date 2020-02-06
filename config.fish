status --is-interactive; and source (rbenv init -|psub)
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1


##### ALIASES

## Directories
alias downloads='cd ~/Downloads'
alias docs='cd ~/Documents'
alias projects='cd ~/projects'
alias yearup='cd ~/Documents/education/YearUp'
alias learnshit='cd ~/Documents/education'
alias dotfiles='cd ~/dotfiles'
alias ..='cd ..'
alias doexercism='cd /home/michelkazi/snap/exercism/5/exercism'

## Dotfile Configs
alias ckitty='vim ~/dotfiles/kitty.conf'
alias vrc='vim ~/dotfiles/.vimrc'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias ctmux='vim ~/dotfiles/.tmux.conf.local'
alias cfish='vim ~/dotfiles/config.fish'
alias ivrc='vim ~/.ideavimrc'

## Misc Shortcuts
alias yv='googler -w youtube.com --url-handler mpv $argv'
alias javacall='javac *.java'
alias py3='python3'
alias npmfix='npm audit fix'
alias ls='exa'
alias back='cd -'
alias ex='exit'
alias ga='git add .'
alias vi='vim'

## Sanity checks
alias :wq='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'

##### Functions & Passwords
source ~/.config/fish/functions/bobthefish_colors.fish
source /home/michelkazi/dotfiles/mkcd.fish
source /home/michelkazi/.config/fish/passwords.fish

##### Development Configs

## Golang
# set the workspace path
set -x GOPATH ~/go
set -gx GOROOT /usr/local/go
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s /home/michelkazi/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

###### XTERM Config
export TERM=xterm-256color
