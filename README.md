## Dependencies 
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

### EWW
```
git clone https://github.com/elkowar/eww
cargo build --release --no-default-features --features=wayland
```
### Pywal
```
yay -S python-pywalfox
pywalfox install
moz-extension://8a2443cd-ba37-413c-9fc1-cf861e75dbe8/ui/settings.html
```

### Docker 
```
systemctl enable docker
systemctl start docker
```
