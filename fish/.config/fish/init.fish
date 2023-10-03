
# # Start fish in tmux
# if status is-interactive
# and not set -q TMUX
#    exec tmux new-session -A -s Base
# end

set theme_nerd_fonts yes

##### ALIASES
alias whereami='hostname'

## Directories
alias downloads='cd ~/Downloads'
alias docs='cd ~/Documents'
alias projects='cd ~/projects'
alias dotfiles='cd ~/dotfiles'
alias ..='cd ..'

# GrEP
alias wherethefuckis='grep -nri'

# Git
alias ignore='vim .gitignore'
alias co='git checkout'
alias ga='git add .'
alias gff='git pull; and git pull origin master'
alias fetchup='git fetch upstream'
alias commit="git commit"
# github setup to avoid clashing users with company bitbucket
alias githubsetup='git config --local user.email "michel.m.kazi@gmail.com"; and git config --local user.name "michelkazi"' 
alias bitbucketsetup='git config --local user.email "Michel.Kazi@xandr.com"; and git config --local user.name "MICHEL KAZI"' 

## Dotfile Configs
alias skhdrc='vim ~/dotfiles/skhd/.config/skhd'
alias yabairc='vim ~/dotfiles/yabai/.config/yabai'
alias sketchybarrc='vim ~/dotfiles/yabai/.config/yabai'
alias ckitty='vim ~/dotfiles/kitty/.config/kitty/kitty.conf'
alias vrc='vim ~/dotfiles/nvim/.config/nvim/'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias dotpull='dotfiles; and git pull; and back'
alias ctmux='vim ~/dotfiles/tmux/.tmux.conf.local'
alias cfish='vim ~/dotfiles/fish/.config/fish/init.fish'

## Docker
alias dockerfile='vim Dockerfile'
alias dockercompose='vim docker-compose.yml'
alias dockompose='docker-compose'

## Misc Shortcuts
alias vim='nvim'
alias copydir='pwd | xclip'
alias sfish='source ~/dotfiles/fish/.config/fish/config.fish'
alias javacall='javac *.java'
alias py3='python3'
alias ls='lsd'
alias back='cd -'
alias nv='nvim'
alias v='vim'
alias vg='vim -p (git status --porcelain | awk \'{print $2}\')'
alias readme='vim README.md'
alias secrets='vim ~/.config/fish/passwords.fish'

## Sanity checks
alias :wq='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias pls='sudo'

##### Functions & Passwords
source ~/dotfiles/fish/.config/fish/mkcd.fish
source ~/dotfiles/fish/.config/fish/venvinit.fish
source ~/dotfiles/fish/.config/fish/vfinit.fish
source ~/dotfiles/fish/.config/fish/themes/tokyonight.fish
source ~/dotfiles/btf_colors/bobthefish-glyphs-custom-separators.fish
source ~/dotfiles/btf_colors/bobthefish-theme-rigel.fish

if test -e ~/.config/fish/secrets.fish
  source ~/.config/fish/secrets.fish
end

if test -e ~/.config/fish/k9s-alias.fish
  source ~/k9s-alias.fish
end

##### Development Configs

## Python
set -g VIRTUAL_ENV_DISABLE_PROMPT 1
## Golang
# set the workspace path
set -x GOPATH ~/go
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s ~/.nvm-fish/nvm.fish; and source ~/.nvm-fish/nvm.fish
# Java
set -gx JAVA_HOME (/usr/libexec/java_home)

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

export PATH="$HOME/.cargo/bin:$PATH"


set -gx ZWIFT_SRC_HOME "$HOME/zwift"

starship init fish | source

set -gx GPG_TTY "/dev/ttys001"
