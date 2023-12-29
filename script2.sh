sudo pacman -S ufw --noconfirm

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw enable

sudo pacman -S virtualbox linux-headers --noconfirm

sudo vboxreload

sudo pacman -S openvpn --noconfirm

sudo pacman -S nmap --noconfirm

yay -S gobuster

sudo pacman -S inetutils --noconfirm

sudo pacman -S smbclient --noconfirm

sudo pacman -S redis --noconfirm

sudo pacman -S freerdp --noconfirm

yay -S mongodb-bin

sudo pacman -S rsync --noconfirm

sudo pacman -S mariadb --noconfirm

sudo pacman -S john --noconfirm

sudo pacman -S python-pip --noconfirm

sudo pacman -S python-netifaces --noconfirm

sudo yay -S responder

sudo pacman -S net-tools --noconfirm

sudo pacman -S ruby --noconfirm

gem install winrm winrm-fs stringio

gem install evil-winrm

sudo pacman -S openssl --noconfirm

sudo pacman -S aws-cli --noconfirm

yay -S ltrace

sudo pacman -S radare2 --noconfirm

yay -S hydra

echo 'export PATH="$PATH:/$HOME/.local/share/gem/ruby/3.0.0/bin"' >> ~/.zshrc
