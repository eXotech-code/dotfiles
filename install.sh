#!/bin/sh
echo Starting dotfiles installation...
echo Installing Oh My Zsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo Installing some Zsh plugins...
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo installing Spaceship Zsh theme...
git clone https://github.com/denysdovhan/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh}/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-~/.oh-my-zsh}/themes/spaceship.zsh-theme"
echo Installing vim-plug...
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo Symlinking all dotfiles...
if [ $1 == "container" ]; then
	rm ~/.vimrc
	rm ~/.zshrc
	rm ~/.tmux.conf
	stow -t /root vim
	stow -t /root tmux
	stow -t /root zsh
else
	stow vim
	stow tmux
	stow vscode
	stow zsh
fi
echo Done!
