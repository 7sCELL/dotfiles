#cd to dotfiles 
echo "Changing directory to dotfiles"
cd dotfiles

# Install essential packages using pacman
echo "Installing essential packages using pacman"
sudo pacman -S git terminator trash-cli curl kitty playerctl neovim polybar steam bluez bluez-utils blueman pulseaudio pulseaudio-bluetooth pavucontrol picom brightnessctl rofi gvfs-smb feh thunar grub-customizer bpytop ranger os-prober xorg-xrandr

# Install additional packages using yay
echo "Installing additional packages using yay"
sudo yay -S kew

#remove the old conf folders 
echo "Removing old config folders"
cd ~/.config
trash terminator i3 ploybar hypr

#mkdir pic and cd to Pic folder and installs a wallpaper pack
echo "Creating Pic directory and installing wallpaper pack"
cd
git clone https://github.com/ChrisTitusTech/nord-background
mv nord-background Pic

echo "Changing directory to dotfiles"
cd ~/dotfiles

#move the conf folders to ~/.config
echo "Moving config folders to ~/.config"
mv -f terminator i3 hypr polybar ~/.config

echo "Changing directory to ~/.config/i3"
cd ~/.config/i3
echo "Setting permissions for launch.sh and temp.sh"
sudo chmod +777 launch.sh temp.sh

# Start and enable the Bluetooth service
echo "Starting and enabling the Bluetooth service"
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# Change directory to /etc and set GTK theme to Adwaita-dark
echo "Changing directory to /etc and setting GTK theme to Adwaita-dark"
cd /etc
echo "GTK_THEME=Adwaita-dark" | sudo tee environment

# Return to the home directory
echo "Returning to the home directory"
cd

# Open the picom configuration file with nvim (requires user interaction)
echo "Opening the picom configuration file with nvim"
sudo nvim /etc/xdg/picom.conf

# Clone NvChad starter configuration for Neovim and open Neovim (requires user interaction)
echo "Cloning NvChad starter configuration for Neovim and opening Neovim"
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Change directory to /etc/X11/xorg.conf.d/ and create a touchpad configuration file
echo "Changing directory to /etc/X11/xorg.conf.d/ and creating a touchpad configuration file"
cd /etc/X11/xorg.conf.d/
echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "True"
EndSection' | sudo tee touchpad-tap.conf

# Indicate that the script has finished
echo "Script has finished."
