#!/bin/bash
#make keys
ssh-keygen -t rsa -N '' -f ~/.ssh/id_git_school
ssh-keygen -t rsa -N '' -f ~/.ssh/id_git
dummy=""
config="
Host github
  User cperryoh
  IdentityFile ~/.ssh/id_git
  HostName github.com
Host githubSchool
  User perryca 
  IdentityFile ~/.ssh/id_git_school
  HostName github.com
"
echo "$config" >> ~/.ssh/config
curl -sL install-node.vercel.app/lts | sudo bash
echo "Enter this key into github home"
cat ~/.ssh/id_git.pub
echo "Press enter to continue"
read dummy
echo "Enter this key into github school"
cat ~/.ssh/id_git_school.pub
echo "Press enter to continue"
read dummy

#install packages
sudo apt-get update
sudo apt update
sudo apt install unzip zip

#install oh my posh
mkdir ~/.config
git clone https://github.com/JanDeDobbeleer/oh-my-posh.git ~/.config/oh-my-posh
mv ~/.config/oh-my-posh/themes ~/.config/
sudo rm -r ~/.config/oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s
echo "eval \"\$(oh-my-posh init bash --config ~/.config/themes/atomicBit.omp.json)\"" >> ~/.bashrc

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
echo "export PATH=\"\$PATH:/opt/nvim/bin:/home/ubuntu/.local/bin\"" >> ~/.bashrc
echo "eval \"\$(zoxide init bash --cmd cd)\"" >> ~/.bashrc

#install nvim 
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz
mv nvim-linux64 nvim
sudo mv nvim /opt
git clone git@github:cperryoh/neovim-config.git ~/.config/nvim
rm nvim-linux64.tar.gz

#install formatters
npm install -g prettier
npm install -g clang-format

#git stuff
git config --global user.name "Cole"
git config --global user.email "cperryoh@gmail.com"
git config --global core.editor "nvim"
