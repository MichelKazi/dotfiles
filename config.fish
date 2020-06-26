# Start fish in tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end

## Remap caps lock
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

##### ALIASES
source ~/dotfiles/xandr.fish
alias xandrgit='git -c http.proxy=socks5h://localhost:1080'
alias whereami='hostname'

## Directories
alias downloads='cd ~/Downloads'
alias docs='cd ~/Documents'
alias projects='cd ~/projects'
alias yearup='cd ~/Documents/education/YearUp'
alias learnshit='cd ~/Documents/education'
alias dotfiles='cd ~/dotfiles'
alias ..='cd ..'
alias xandr='cd ~/Documents/xandr'
alias prebid='cd ~/Documents/xandr/prebid'
alias pbs='cd ~/Documents/xandr/prebid/prebid-server'
alias tvp='cd ~/Documents/xandr/tvp'
alias ctci='cd ~/Documents/education/YearUp/mentor-assignments/ctci'

# GrEP
alias wherethefuckis='grep -nri'

# Git
alias ignore='vim .gitignore'
alias ga='git add .'
alias fetchup='git fetch upstream'
alias mergeup='git merge upstream/master'
alias commit="git commit -am"
alias Commit="git commit -Am"

## Dotfile Configs
alias ckitty='vim ~/dotfiles/kitty.conf'
alias vrc='vim ~/dotfiles/vim/.vimrc'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias dotpull='dotfiles; and git pull; and back'
alias ctmux='vim ~/dotfiles/.tmux.conf.local'
alias cfish='vim ~/dotfiles/config.fish'
alias ivrc='vim ~/.ideavimrc'

## Docker
alias dockerfile='vim Dockerfile'
alias dockercompose='vim docker-compose.yml'
alias dockompose='docker-compose'

## Misc Shortcuts
alias copydir='pwd | xclip'
alias sfish='source ~/dotfiles/config.fish'
alias yv='googler -w youtube.com --url-handler mpv $argv'
alias javacall='javac *.java'
alias py3='python3'
alias npmfix='npm audit fix'
alias ls='lsd'
alias back='cd -'
alias ex='exit'
alias v='vim'
alias readme='vim README.md'
alias dnsrestart='sudo /etc/init.d/dns-clean restart'
alias secrets='vim ~/.config/fish/passwords.fish'

## Sanity checks
alias :wq='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias pls='sudo'

##### Functions & Passwords
source ~/dotfiles/mkcd.fish
source ~/.config/fish/passwords.fish

source ~/dotfiles/btf_colors/bobthefish-theme-rigel.fish
##### Development Configs

## Python
alias venvinit='python3 -m virtualenv env; and source ./env/bin/activate.fish'
set -g VIRTUAL_ENV_DISABLE_PROMPT 1
## Golang
# set the workspace path
alias gopath 'cd $GOPATH/src'
alias maingo 'vim main.go'
set -x GOPATH ~/go
set -gx GOROOT /usr/local/go
set -gx GOPROJECTDIR ~/go/src/github.com/michelkazi
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s ~/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  


export PATH="$HOME/.cargo/bin:$PATH"
set -U fish_user_paths /home/michelkazi/.local/kitty.app/bin/
