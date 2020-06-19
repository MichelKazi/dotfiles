# Start fish in tmux
 if status is-interactive
 and not set -q TMUX
    tmux attach -t BASE; or tmux new -s BASE
 end


##### ALIASES
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
alias prebid='cd ~/prebid'
alias pbs='cd ~/prebid/prebid-server'
alias tvp='cd ~/Documents/xandr/tvp'
alias ctci='cd ~/Documents/education/YearUp/mentor-assignments/ctci'
alias tvp='cd ~/tvp'

# GrEP
alias wherethefuckis='ack -nri'

# Git
alias ignore='vim .gitignore'
alias co='git checkout'
alias ga='git add .'
alias fetchup='git fetch upstream'
alias mergeup='git merge upstream/master'
alias commit="git commit -am"
# github setup to avoid clashing users with company bitbucket
alias githubsetup='git config --local user.email "michel.m.kazi@gmail.com"; and git config --local user.name "michelkazi"' 
alias bitbucketsetup='git config --local user.email "Michel.Kazi@xandr.com"; and git config --local user.name "MICHEL KAZI"' 

## Dotfile Configs
alias ckitty='vim ~/dotfiles/kitty.mac.conf'
alias vrc='vim ~/dotfiles/.vimrc'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias dotpull='dotfiles; and git pull; and back'
alias ctmux='vim ~/dotfiles/.tmux.mac.conf'
alias cfish='vim ~/dotfiles/config.mac.fish'
alias sfish='source ~/.config/fish/config.fish'
alias ivrc='vim ~/.ideavimrc'

## Docker
alias dockerfile='vim Dockerfile'
alias dockercompose='vim docker-compose.yml'
alias dockompose='docker-compose'

# Kubernetes
alias kc='kubectl'
alias ankhtoken='cat ~/.ankubectl_token | pbcopy'

## Misc Shortcuts
alias l='clear'
alias copydir='pwd | pbcopy'
alias yv='googler -w youtube.com --url-handler mpv $argv'
alias javacall='javac *.java'
alias py3='python3'
alias npmfix='npm audit fix'
alias ls='lsd'
alias back='cd -'
alias ex='exit'

## Sanity checks
alias :wq='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias pls='sudo'

##### Functions & Passwords
source ~/dotfiles/mkcd.fish
source ~/dotfiles/btf_colors/bobthefish-theme-rigel.fish
source ~/dotfiles/venvinit.fish

#set -g theme_color_scheme dracula

##### Development Configs
alias vim='nvim'
alias nv='nvim'
alias v='vim'
alias r='ranger'
alias readme='vim README.md'

## Python
#alias venvinit='python3 -m virtualenv env; and source ./env/bin/activate.fish'
set -g VIRTUAL_ENV_DISABLE_PROMPT 1
alias pip='pip3'
set -x PATH $PATH /Users/michelkazi/Library/Python/3.7/bin

## Golang
alias maingo 'vim main.go'
set -x GOPATH ~/go
#set -gx GOROOT /usr/local/opt/go/libexec
#set -gx GOROOT /usr/local/bin
set -gx GOPROJECTDIR ~/go/src/github.com/michelkazi
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s ~/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

set -x PATH $PATH /usr/local/opt/rabbitmq/sbin
alias rmq='rabbitmqctl'

export PATH="$HOME/.cargo/bin:$PATH"
