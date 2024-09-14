sudo apt install -y zsh

chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

sudo apt-get install fonts-powerline

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

sed -i 's/ZSH_THEME="agnoster"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
