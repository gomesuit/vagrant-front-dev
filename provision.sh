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
ln -s /vagrant/settings/vimrc ~/.vimrc

# install nodejs
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> .bash_profile
source ~/.bash_profile
nodebrew install-binary v6.9.5
nodebrew use v6.9.5

# install bash-completion
sudo yum install -y bash-completion
echo '[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion' >> ~/.bash_profile

# install rbenv
sudo yum install -y git gcc bzip2 openssl-devel readline-devel zlib-devel
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# install ruby
rbenv install 2.2.3
rbenv rehash
rbenv global 2.2.3

# install sass
gem install sass

# install nginx
sudo yum install -y epel-release
sudo yum install -y nginx
systemctl enable nginx
ln -sf /vagrant/settings/nginx.conf /etc/nginx/nginx.conf
systemctl start nginx

# git clone git@github.com:gomesuit/larning-frontend.git


