#!/bin/bash

#GIT
echo "Installing git..."
sleep 2
sudo apt install git-all

#ZSH
echo "Installing zsh and Oh My Zsh..."
touch $HOME/.zshrc
sleep 2
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cat ./aliases >> $HOME/.zshrc
sleep 1
##Theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"



#GIT CONFIG
echo "Config global config for git"
sleep 1
echo "Enter your user.name: "
read git_user_name
sleep 1
echo "Enter your user.email: "
read git_user_email

git config --global user.name $git_user_name
git config --global user.email $git_user_email


#RUBY 
echo "Installing ruby..."
sleep 1
sudo apt install rbenv
rbenv init
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
sudo apt install libpq-dev
rbenv install $(rbenv install -l | grep -v - | tail -1)


#NVM 
echo "Installing nvm..."
sleep 2
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
cat ./.exports >> ~/.zshrc


#Snap and SnapStore
echo "Snap and SnapStore..."
sleep 1
sudo apt update
sudo apt install snapd
sudo snap install snap-store

#Installing vscode
echo "vscode"
sleep 2
mkdir -p ~/tmp
cd ~/tmp
curl -o code.deb -L https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-deb-x64
sudp dpkg -i code.deb
cd $HOME


#Installing postgreSQL
echo "PostgreSQL"
sleep 2
sudo apt update
sudo apt install postgresql postgresql-contrib

echo "Create user for postgreSQL"
sudo su postgres <<EOF
createuser --superuser guarapolabs
EOF


#DBeaver 
echo "DBeaver"
sleep 1 
cd ~/tmp
curl -o dbeaber.deb -L https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaber.deb
cd $HOME
