## Dependencias 
### Wallpaper swww
```
yay -S swww
```

### Install startship
```
curl -sS https://starship.rs/install.sh | sh
```

### instalar oh my zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Manejar fonts
```
yay font-manager
yay file-roller
```

### Chronyd
```
sudo systemctl enable chronyd
sudo systemctl start chronyd
```

### Python
```
yay python-virtualenv
```

### Neovim
```
:TSInstall markdown markdown_inline
```

### Pfetch
```
yay pfetch
```

### TMUX
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Instalar plugins de tmux: C-a + I

### EWW
```
git clone https://github.com/elkowar/eww
cargo build --release --no-default-features --features=wayland
```
### Pywal
```
yay -S python-pywalfox
sudo pywalfox install
moz-extension://8a2443cd-ba37-413c-9fc1-cf861e75dbe8/ui/settings.html
```

### Docker 
```
sudo systemctl enable docker
sudo systemctl start docker
```

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

### SDDM 
```
sudo systemctl enable sddm.service 
```
En ```/etc/sddm.conf.d```
```
DisplayServer=wayland 
ReuseSession=false
```

En ```usr/share/sddm/scripts``` agregar
```
export XDG_CURRENT_DESKTOPS=wayland
export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER_ALLOW_SOFTWARE=1
```

systemctl --user start pipewire
systemctl --user enable pipewire
systemctl --user start pipewire-pulse.service
systemctl --user enable pipewire-pulse.service


yay nm-connection-editor
yay network-manager-apple
