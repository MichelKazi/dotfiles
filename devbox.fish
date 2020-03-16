# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

##### ALIASES

## Directories
alias downloads='cd ~/Downloads'
alias docs='cd ~/Documents'
alias projects='cd ~/projects'
alias prebid='cd ~/prebid'
alias dotfiles='cd ~/dotfiles'
alias ..='cd ..'

## Dotfile Configs
alias vrc='vim ~/dotfiles/.vimrc'
alias dotpush='dotfiles; and ./deploy.bash; and back'
alias ctmux='vim ~/dotfiles/.tmux.conf.local'
alias cfish='vim ~/dotfiles/devbox.fish'

## Misc Shortcuts
alias sfish='source ~/dotfiles/config.fish'
alias yv='googler -w youtube.com --url-handler mpv $argv'
alias py3='python3'
alias npmfix='npm audit fix'
alias ls='lsd'
alias back='cd -'
alias ex='exit'
alias ga='git add .'
alias vi='vim'
alias readme='vim README.md'

## Sanity checks
alias :wq='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'

## Salesforce stuff
alias apexclass='sfdx force:apex:class:create -n'
alias apextrigger='sfdx force:apex:trigger:create -n'
alias apextest='sfdx force:apex:test:create -n'
alias openorg='sfdx force:org:open -u'
alias sfdxlogin='sfdx:auth:web:login'
alias trailhead='cd ~/xandr/learning/salesforce'
alias executeanon='sfdx force:apex:execute'
alias forcepush='sfdx:force:source:push'
alias forcepull='sfdx:force:source:pull'
source ~/dotfiles/mdapideploy.fish

##### Functions & Passwords
source ~/dotfiles/mkcd.fish

##### Development Configs

## Golang
# set the workspace path
alias gopath 'cd $GOPATH/src/github.com/michelkazi'
set -x GOPATH ~/go
set -gx GOROOT /usr/local/go
set -gx GOPROJECTDIR ~/go/src/github.com/michelkazi
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

