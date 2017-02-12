#!/bin/bash
set -e

# install vim
sudo yum install -y lua-devel ncurses-devel git gcc
git clone https://github.com/vim/vim.git
cd vim
./configure \
  --prefix=/usr/local \
  --with-features=huge \
  --enable-multibyte \
  --enable-luainterp \
  --enable-cscope \
  --enable-fail-if-missing
make
sudo make install
cd

# install NeoBundle
sudo yum install -y lua-devel ncurses-devel git
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# setting vim
#mkdir ~/.vim/indent
ln -s /vagrant/setting/vimrc ~/.vimrc

# install nodejs
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> .bash_profile
source ~/.bash_profile
nodebrew install-binary v6.9.5
nodebrew use v6.9.5

# install bash-completion
sudo yum install -y bash-completion
echo '[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion' >> ~/.bash_profile


# git clone git@github.com:gomesuit/larning-frontend.git

