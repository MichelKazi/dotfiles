#!/bin/bash

echo "install packages..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
<brew.txt xargs brew install

echo "install Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --default-toolchain=nightly --profile=default --component=rust-src,rustfmt

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

while [ ! $# -eq 0  ]
do
  case "$1" in
    --source | -s)
      echo "sourcing dotfiles..."
      echo "source $HOME/dotfiles/vim/init.vim" >> $HOME/.vimrc
      echo "source $HOME/dotfiles/macos/config.mac.fish" >> $HOME/.config/fish/config.fish
      echo "source-file $HOME/dotfiles/macos/.tmux.mac.conf" >> $HOME/.tmux.conf
      echo "include $HOME/dotfiles/macos/kitty.mac.conf" >> $HOME/.config/kitty/kitty.conf
  esac
  shift
done

