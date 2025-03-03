sudo pacman -S git terminator trash-cli curl kitty playerctl neovim polybar steam bluez bluez-utils blueman pulseaudio pulseaudio-bluetooth pavucontrol picom brightnessctl rofi gvfs-smb feh thunar grub-customizer bpytop ranger os-prober xorg-xrandr
sudo yay -S kew
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
sudo cd /etc
echo "GTK_THEME=Adwaita-dark" > environment
cd
sudo nvim /etc/xdg/picom.conf
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
cd
sudo cd /etc/X11/xorg.conf.d/
echo "Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "True"
EndSection" > touchpad-tap.conf
echo "Script has finished successfully." 
