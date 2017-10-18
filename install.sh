# Installo i pacchettini deb tattici
sudo apt install dirmngr
cd /tmp
wget -O libssl.deb "http://ftp.it.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb"
sudo dpkg -i libssl.deb
wget -O playerctl5.deb "https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb"
sudo dpkg -i playerctl5.deb

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list


# Rimuovo le cose non necessarie
sudo apt remove gedit

# Installo le cose
sudo apt update
sudo apt install fish i3 i3blocks rofi terminator vim vim-gtk3 fonts-inconsolata compton arandr dunst \
spotify-client sublime-text lxappearance xfce4-power-manager pavucontrol build-essential curl redshift-gtk vlc zip ufw  

# Oh my fish
cd $HOME/Scaricati
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

# Aggiorno e pulisco tutto
sudo apt upgrade
sudo apt dist-upgrade
sudo apt clean
sudo apt autoremove
sudo apt autoclean

# Collego i dotfiles
ln -sf $HOME/Dotfiles/i3 $HOME/.config/i3
ln -sf $HOME/Dotfiles/terminator $HOME/.config/terminator
ln -sf $HOME/Dotfiles/fish $HOME/.config/fish
ln -sf $HOME/Dotfiles/rofi $HOME/.config/rofi
ln -sf $HOME/Dotfiles/sublime-text $HOME/.config/sublime-text-3
ln -sf $HOME/Dotfiles/vim/gvim $HOME/.gvim
ln -sf $HOME/Dotfiles/vim/vim $HOME/.vim
ln -sf $HOME/Dotfiles/vim/gvimrc $HOME/.gvimrc
ln -sf $HOME/Dotfiles/compton.conf $HOME/.compton.conf
mkdir $HOME/.config/dunst
sudo ln -sf $HOME/Dotfiles/dunstrc $HOME/.config/dunst/dunstrc
ln -sf $HOME/Dotfiles/mimeapps.list $HOME/.config/mimeapp.list
echo "Fatto"
