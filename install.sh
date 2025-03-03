#cd to dotfiles 
cd dotfiles

# Install essential packages using pacman
sudo pacman -S git terminator trash-cli curl kitty playerctl neovim polybar steam bluez bluez-utils blueman pulseaudio pulseaudio-bluetooth pavucontrol picom brightnessctl rofi gvfs-smb feh thunar grub-customizer bpytop ranger os-prober xorg-xrandr

#remove the old conf folders 
cd ~/.config
trash terminator i3 ploybar hypr

cd ~/dotfiles

#move the conf folders to ~/.config
mv -f terminator i3 hypr polybar ~/.config

# Install additional packages using yay
sudo yay -S kew

# Start and enable the Bluetooth service
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# Change directory to /etc and set GTK theme to Adwaita-dark
cd /etc
echo "GTK_THEME=Adwaita-dark" | sudo tee environment

# Return to the home directory
cd

# Open the picom configuration file with nvim (requires user interaction)
sudo nvim /etc/xdg/picom.conf

# Clone NvChad starter configuration for Neovim and open Neovim (requires user interaction)
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Change directory to /etc/X11/xorg.conf.d/ and create a touchpad configuration file
cd /etc/X11/xorg.conf.d/
echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "True"
EndSection' | sudo tee touchpad-tap.conf

#linutil for chris titus 
curl -fsSL https://christitus.com/linux | sh

# Indicate that the script has finished
echo "Script has finished."
