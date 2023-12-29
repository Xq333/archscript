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

sudo pacman -S mariadb

sudo pacman -S john
