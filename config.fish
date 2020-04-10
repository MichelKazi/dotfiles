# Start fish in tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end


##### ALIASES
alias devbox3488='ssh mk700f@3488.mk700f.user.nym2.adnexus.net'
#alias 3488='ssh -t -A mk700f@jump.adnxs.net \'go 3488\''
alias 3487='ssh -t -A mk700f@jump.adnxs.net \'ssh -A 3487.mk700f.user.nym2.adnexus.net \''
alias 3488='ssh -t -A mk700f@jump.adnxs.net \'ssh -t -A 3488.mk700f.user.nym2.adnexus.net "/usr/bin/fish"\''
alias xandrgit='git -c http.proxy=socks5h://localhost:1080'

## Directories
alias downloads='cd ~/Downloads'
alias docs='cd ~/Documents'
alias projects='cd ~/projects'
alias yearup='cd ~/Documents/education/YearUp'
alias learnshit='cd ~/Documents/education'
alias dotfiles='cd ~/dotfiles'
alias ..='cd ..'
alias doexercism='cd /home/michelkazi/snap/exercism/5/exercism'
alias xandr='cd /home/michelkazi/Documents/xandr'

# Git
alias ignore='vim .gitignore'
alias ga='git add .'
alias fetchup='git fetch upstream'
alias mergeup='git merge upstream/master'

## Dotfile Configs
alias ckitty='vim ~/dotfiles/kitty.conf'
alias vrc='vim ~/dotfiles/.vimrc'
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
alias vi='vim'
alias readme='vim README.md'
alias dnsrestart='sudo /etc/init.d/dns-clean restart'

## Sanity checks
alias :wq='echo "You\'re not using VIM, pal"'
alias :w='echo "You\'re not using VIM, pal"'
alias :q='echo "You\'re not using VIM, pal"'
alias pls='sudo'

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
source /home/michelkazi/dotfiles/mdapideploy.fish

##### Functions & Passwords
source /home/michelkazi/dotfiles/mkcd.fish
source /home/michelkazi/.config/fish/passwords.fish

set -g theme_color_scheme dracula

##### Development Configs

## Golang
# set the workspace path
alias gopath 'cd $GOPATH/src/github.com/$USER'
set -x GOPATH ~/go
set -gx GOROOT /usr/local/go
set -gx GOPROJECTDIR ~/go/src/github.com/michelkazi
# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
test -s /home/michelkazi/.nvm-fish/nvm.fish; and source /home/michelkazi/.nvm-fish/nvm.fish

## NPM
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $NPM_PACKAGES/bin $PATH

set MANPATH $NPM_PACKAGES/share/man $MANPATH  


export PATH="$HOME/.cargo/bin:$PATH"
