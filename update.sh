#!/bin/sh
echo backing up dotfiles...
echo copying .zshrc
cp ~/.zshrc ./zsh
echo done
echo copying .vimrc
cp ~/.vimrc ./vim
echo done
echo copying VS Code config
cp ~/.config/Code/User/settings.json ./vscode
echo done
echo copying .tmux.conf
cp ~/.tmux.conf ./tmux
echo done
echo copying zathurarc
cp ~/.config/zathura/zathurarc ./zathura
echo done
echo adding to git
git add .
echo "Update finished. Don't forget to commit your changes."
