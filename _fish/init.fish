# Start fish in tmux
if status is-interactive
and not set -q TMUX
   exec tmux new-session -A -s Base
end

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
alias gitcp="git branch --show-current | tr -d '\n' | pbcopy"
alias ignore='vim .gitignore'
alias co='git checkout'
alias ga='git add .'
alias fetchup='git fetch upstream'
alias syncup='git switch main; fetchup; and git merge upstream/main; and git push'
alias ff='syncup; and git checkout -; and git merge main; and git push'
alias commit="yarn commit; or git commit"
# github setup to avoid clashing users with company bitbucket
alias githubsetup='git config --local user.email "michel.m.kazi@gmail.com"; and git config --local user.name "michelkazi"' 
alias bitbucketsetup='git config --local user.email "Michel.Kazi@xandr.com"; and git config --local user.name "MICHEL KAZI"' 
alias rebaseup='git checkout main; and git pull; and git pull upstream main; and git checkout '-

## Dotfile Configs
alias ckitty='vim ~/dotfiles/kitty.conf'
alias vrc='vim ~/dotfiles/vim/'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias dotpull='dotfiles; and git pull; and back'
alias ctmux='vim ~/dotfiles/.tmux.conf.local'
alias cfish='vim ~/dotfiles/fish/init.fish'

## Docker
alias dockerfile='vim Dockerfile'
alias dockercompose='vim docker-compose.yml'
alias dockompose='docker-compose'

## Misc Shortcuts
alias vim='nvim'
alias copydir='pwd | xclip'
alias sfish='source ~/dotfiles/fish/init.fish'
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
source ~/dotfiles/fish/mkcd.fish
source ~/dotfiles/fish/venvinit.fish
source ~/dotfiles/fish/vfinit.fish
source ~/dotfiles/btf_colors/bobthefish-theme-rigel.fish
source ~/dotfiles/btf_colors/bobthefish-glyphs-custom-separators.fish
#source ~/dotfiles/btf_colors/bobthefish-theme-gruvbox-v2.fish
##### Development Configs

## Python
set -g VIRTUAL_ENV_DISABLE_PROMPT 1
## Golang
# set the workspace path
set -x GOPATH ~/go
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s ~/.nvm-fish/nvm.fish; and source ~/.nvm-fish/nvm.fish

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

export PATH="$HOME/.cargo/bin:$PATH"
