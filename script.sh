#!/bin/sh

# Mise à jour des paquets
echo "Mise à jour du système..."
sudo pacman -Syu --noconfirm

# Installation des éditeurs de texte Vim et NeoVim, de Curl, et de Git
echo "Installation de Vim, NeoVim, Curl et Git..."
sudo pacman -S vim neovim curl git --noconfirm

# Installation d'Awesome WM et de ses dépendances
echo "Installation d'Awesome WM..."
sudo pacman -S awesome vicious --noconfirm

# Installation de LightDM comme gestionnaire de connexion (si nécessaire)
echo "Installation de LightDM..."
sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm
sudo systemctl enable lightdm

# Installation de yay pour les paquets AUR
echo "Installation de yay pour AUR..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# Utilisation de yay pour installer Spotify
echo "Installation de Spotify via AUR..."
yay -S spotify --noconfirm

# Installation de Zsh, Neofetch et WezTerm
echo "Installation de Zsh, Neofetch et WezTerm..."
sudo pacman -S zsh neofetch wezterm --noconfirm

# Créer le répertoire pour les polices si nécessaire
echo "Création du répertoire des polices..."
mkdir -p ~/.local/share/fonts

# Télécharger la police MesloLGS NF
echo "Téléchargement de la police MesloLGS NF..."
curl -fLo "~/.local/share/fonts/MesloLGS NF Regular.ttf" --create-dirs \
    "https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf"

# Mettre à jour le cache des polices
echo "Mise à jour du cache des polices..."
fc-cache -f -v

# Téléchargement du script d'installation Oh-My-Zsh
echo "Téléchargement du script d'installation Oh-My-Zsh..."
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o ohmyzsh-install.sh

# Modification du script pour éviter le changement automatique du shell
sed -i 's/exec zsh -l//g' ohmyzsh-install.sh

# Exécution du script d'installation Oh-My-Zsh modifié
echo "Installation de Oh-My-Zsh..."
sh ohmyzsh-install.sh

# Changement du shell par défaut en Zsh
echo "Définition de Zsh comme shell par défaut..."
chsh -s $(which zsh)

# Téléchargement et installation du thème Powerlevel10k pour Oh-My-Zsh
echo "Installation du thème Powerlevel10k pour Oh-My-Zsh..."
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Modification de .zshrc pour utiliser le thème Powerlevel10k
echo "Configuration du thème Powerlevel10k dans .zshrc..."
sed -i 's|^ZSH_THEME=".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

echo "Configuration de Powerlevel10k..."
cp ./config/p10k.config ~/.p10k.zsh

# Ajout de Neofetch au démarrage du terminal
echo "Configuration de Neofetch au démarrage..."
echo "neofetch" >> ~/.zshrc

# Création d'un alias pour NeoVim
echo "Création de l'alias pour NeoVim..."
echo "alias vi='nvim'" >> ~/.zshrc

# Activation du gestionnaire de session SDDM
echo "Activation de SDDM..."
sudo systemctl enable sddm

# Activation de NetworkManager
echo "Activation de NetworkManager..."
sudo systemctl enable NetworkManager

# Installation de Kvantum pour les thèmes
echo "Installation de Kvantum..."
sudo pacman -S kvantum-qt5 --noconfirm

# Sauvegarde du fichier de configuration des raccourcis
echo "Sauvegarde du fichier de configuration des raccourcis..."
cp ~/.config/kglobalshortcutsrc ~/.config/kglobalshortcutsrc.backup

# Copie du fichier de configuration des raccourcis personnalisé
echo "Mise à jour des raccourcis clavier avec le fichier personnalisé..."
cp ./config/shortcuts.config ~/.config/kglobalshortcutsrc

echo "Installation des outils Bluetooth..."
sudo pacman -S bluez bluez-utils blueman --noconfirm

# Activation du service Bluetooth
echo "Activation du service Bluetooth..."
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Installation de Docker
echo "Installation de Docker..."
sudo pacman -S docker --noconfirm

# Activer et démarrer le service Docker
echo "Activation du service Docker..."
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Ajouter l'utilisateur courant au groupe docker
echo "Ajout de l'utilisateur $(whoami) au groupe Docker..."
sudo usermod -aG docker $(whoami)

# Installation de Docker Compose
echo "Installation de Docker Compose..."
sudo pacman -S docker-compose --noconfirm

# Installation de Fira code
sudo pacman -S ttf-fira-code

# Define the configuration directory and file
WEZTERM_CONFIG_DIR="$HOME/.config/wezterm"
WEZTERM_CONFIG_FILE="$WEZTERM_CONFIG_DIR/wezterm.lua"

# Create the WezTerm configuration directory if it doesn't exist
mkdir -p "$WEZTERM_CONFIG_DIR"

# Copy the wezterm.lua configuration file
# Assuming the configuration file is located at ~/wezterm.lua on your system
# You can adjust the source path as needed
cp ./config/wezterm.config "$WEZTERM_CONFIG_FILE"

echo "Script terminé. Veuillez redémarrer votre système pour appliquer les changements."

