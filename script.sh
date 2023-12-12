#!/bin/sh

# Mise à jour des paquets
echo "Mise à jour du système..."
sudo pacman -Syu --noconfirm

# Installation des éditeurs de texte Vim et NeoVim, de Curl, et de Git
echo "Installation de Vim, NeoVim, Curl et Git..."
sudo pacman -S vim neovim curl git --noconfirm

# Installation de l'environnement de bureau KDE Plasma et des applications associées, de Xorg et de quelques utilitaires
echo "Installation de KDE Plasma, applications KDE, Xorg, et utilitaires..."
sudo pacman -S plasma-meta kde-applications-meta xorg konsole yakuake dolphin sddm --noconfirm

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

# Configuration du thème Powerlevel10k dans .zshrc
echo "Configuration du thème Powerlevel10k dans .zshrc..."
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

# Modification de .zshrc pour utiliser le thème Powerlevel10k
echo "Configuration du thème Powerlevel10k dans .zshrc..."
sed -i 's|^ZSH_THEME=".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

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

# Modification du fichier de raccourcis pour utiliser WezTerm au lieu de Konsole
echo "Modification du raccourci pour WezTerm..."
sed -i 's/Konsole/WezTerm/g' ~/.config/kglobalshortcutsrc

# Recharger la configuration des raccourcis clavier
echo "Rechargement de la configuration des raccourcis clavier..."
qdbus org.kde.kglobalaccel /component/khotkeys reconfigure

echo "Script terminé. Veuillez redémarrer votre système pour appliquer les changements."

