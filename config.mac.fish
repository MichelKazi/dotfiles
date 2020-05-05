# Start fish in tmux
if status is-interactive
and not set -q TMUX
    exec tmux
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
alias master='git checkout master'
alias pullreq='git push origin master'
alias ignore='vim .gitignore'
alias co='git checkout'
alias ga='git add .'
alias fetchup='git fetch upstream'
alias mergeup='git merge upstream/master'
alias commit="git commit -am"
alias Commit="git commit -Am"

## Dotfile Configs
alias ckitty='vim ~/dotfiles/kitty.mac.conf'
alias vrc='vim ~/dotfiles/.vimrc'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias dotpull='dotfiles; and git pull; and back'
alias ctmux='vim ~/dotfiles/.tmux.mac.conf'
alias cfish='vim ~/dotfiles/config.mac.fish'
alias sfish='source ~/dotfiles/config.mac.fish'
alias ivrc='vim ~/.ideavimrc'

## Docker
alias dockerfile='vim Dockerfile'
alias dockercompose='vim docker-compose.yml'
alias dockompose='docker-compose'

## Misc Shortcuts
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

#set -g theme_color_scheme dracula

##### Development Configs
alias nv='nvim'
alias v='vim'
alias r='ranger'
alias readme='vim README.md'

## Python
alias venvinit='python3 -m virtualenv env; and source ./env/bin/activate.fish'
set -g VIRTUAL_ENV_DISABLE_PROMPT 1
alias pip='pip3'

## Golang
alias maingo 'vim main.go'
set -x GOPATH ~/go
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GOPROJECTDIR ~/go/src/github.com/michelkazi
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s ~/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  


export PATH="$HOME/.cargo/bin:$PATH"
