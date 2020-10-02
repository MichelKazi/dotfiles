#!/bin/bash

echo "install packages..."
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu
<packages.txt xargs sudo pacman -S --noconfirm

echo "Swapping Caps Lock(LCTRL macro) to escape..."
xcape -e 'Control_L=Escape'

echo "install Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --default-toolchain=nightly --profile=default --component=rust-src,rustfmt

echo "install Go..."
mkdir -p ~/go/bin/
wget -c https://golang.org/dl/go1.15.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local/

echo "prepare install of packages..."
PATH=/usr/local/go/bin:$HOME/.cargo/bin:$HOME/.local/bin/:$PATH
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
. $HOME/.nvm/nvm.sh


echo "install NPM..."
nvm install node && nvm use node

echo "install Python packages..."
<python.txt xargs pip3 install

echo "install Rust packages..."
. $HOME/.cargo/env
<rust.txt xargs cargo install

echo "install Go packages..."
mkdir -p $HOME/go
GOPATH=$HOME/go
<go.txt xargs -I % go get -v %

echo "install Javascript packages..."
<javascript.txt xargs npm i -g

echo "install rclone..."
curl https://rclone.org/install.sh | sudo bash

while [ ! $# -eq 0  ]
do
  case "$1" in
    --source | -s)
      echo "sourcing dotfiles..."
      echo "source $HOME/dotfiles/vim/init.vim" >> $HOME/.vimrc
      echo "source $HOME/dotfiles/fish/init.fish" >> $HOME/.config/fish/config.fish
      echo "source-file $HOME/dotfiles/.tmux.conf.local" >> $HOME/.tmux.conf
      echo "include $HOME/dotfiles/kitty.conf" >> $HOME/.config/kitty/kitty.conf
  esac
  shift
done
