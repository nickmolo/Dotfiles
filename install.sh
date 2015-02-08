#/bin/sh

#########################
#Dotfiles Install Script#
#########################

echo "Installing to $HOME"

cp -f bash_profile $HOME/.bash_profile
cp -f bashrc $HOME/.bashrc
cp -f colordiff $HOME/.colordiff
cp -f colordiffrc $HOME/.colordiffrc
cp -f gitconfig $HOME/.gitconfig
cp -f gitignore $HOME/.gitignore
cp -f htoprc $HOME/.htoprc
  
#Get the correct htop for the system

if [[ $(uname) == 'Linux' ]]; then
    cp -f htop-linux $HOME/.htop
elif [[ $(uname) == 'Darwin' ]]; then
    cp -f htop-osx $HOME/.htop
fi


cp -rf lesspipe .lesspipe
cp -rf .lesspipe $HOME
rm -rf .lesspipe

cp -f profile $HOME/.profile
cp -f smem $HOME/.smem

cp -rf vim .vim
cp -rf .vim $HOME
rm -rf .vim

cp -f vimrc $HOME/.vimrc
cp -f wgetrc $HOME/.wgetrc

echo "Done"
