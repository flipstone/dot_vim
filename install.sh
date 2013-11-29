#!/bin/sh

echo "This will obliterate your ~/.vim, ~/.vimrc and ~/.gvimrc files and directories."
read -p "Sure you want to do this? (y/n) "

case $REPLY in
  [yY])
    ;;
  *)
    echo "Sorry to have bothered you...."
    exit 1
    ;;
esac

cd ~
rm -rf .vim
git clone https://github.com/flipstone/dot_vim.git .vim

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc

echo "Flipstone VIM Files installed!"
