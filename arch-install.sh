#!/bin/bash

PURPLE='\033[0;35m'
YELLOW='\033[0;93m'
CYAN_B='\033[1;96m'
LIGHT='\x1b[2m'
RESET='\033[0m'

pacman_apps=(
  # Essentials
  'man'
  'git'           # Version controll
  'neovim'        # Text editor
  'yazi'        # Directory browser
  'tmux'          # Term multiplexer
  'wget'          # Download files

  # CLI Power Basics
  'aria2'         # Resuming download util (better wget)
  'bat'           # Output highlighting (better cat)
  'exa'           # Listing files with info (better ls)
  'fzf'           # Fuzzy file finder and filtering
  'scrot'         # Screenshots programmatically via CLI
  'thefuck'       # Auto-correct miss-typed commands
  'tree'          # Directory listings as tree structure
  'zoxide'        # Auto-learning navigation (better cd)

  # Development, languages, interpriters, compilers, etc
  'go'            # Go Lang
  'rustup'        # Crab Language
  'python-pip'    # Snake Language
  'nodejs'        # Devil Language
  'npm'
  'ninja'
  'lz4'
  'python-pywal'
  'stow'
  'waybar'
  'zsh-autosuggestions'
  'docker'
  'docker-compose'

  # Monitoring, management and stats
  'btop'          # Live system resource monitoring
  'zsh'
  'jq'
  'chrony'

  # CLI Fun
  'neofetch'      # Show off distro and system info
  'glow'
  'miller'
  'github-cli'
  'obsidian'
  'xdg-desktop-portal' 
  'xdg-desktop-portal-wlr'
  'grim'
  'slurp'
  'wl-clipboard'
  'swappy'
  'sddm'
  'pipewire'
  'pipewire-pulse'
  'pipewire-audio'
  'pipewire-alsa'
)

PROMPT_TIMEOUT=15 # When user is prompted for input, skip after x seconds

# If set to auto-yes - then don't wait for user reply
if [[ $* == *"--auto-yes"* ]]; then
  PROMPT_TIMEOUT=0
  REPLY='Y'
fi

# Print intro message
echo -e "\n${PURPLE}Starting Arch package install / update script"
echo -e "${LIGHT}The following script is for Arch / Arch-based headless systems, and will"
echo -e "update database, upgrade packages, clear cache then install all listed CLI apps."
echo -e "${YELLOW}Before proceeding, ensure your happy with all the packages listed in \e[4m${0##*/}"
echo -e "${RESET}"

# Check if running as root, and prompt for password if not
if [ "$EUID" -ne 0 ]; then
  echo -e "${PURPLE}Elevated permissions are required to adjust system settings."
  echo -e "${CYAN_B}Please enter your password...${RESET}"
  sudo -v
  if [ $? -eq 1 ]; then
    echo -e "${YELLOW}Exiting, as not being run as sudo${RESET}"
    exit 1
  fi
fi

# Check pacman actually installed
if ! hash pacman 2> /dev/null; then
  echo "${YELLOW_B}Pacman doesn't seem to be present on your system. Exiting...${RESET}"
  exit 1
fi

# Prompt user to update package database
echo -e "${CYAN_B}Would you like to update package database? (y/N)${RESET}\n"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -e "${PURPLE}Updating database...${RESET}"
  sudo pacman -Syy --noconfirm
fi

# Prompt user to upgrade currently installed packages
echo -e "${CYAN_B}Would you like to upgrade currently installed packages? (y/N)${RESET}\n"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -e "${PURPLE}Upgrading installed packages...${RESET}"
  sudo pacman -Syu --noconfirm
fi

# Prompt user to clear old package caches
echo -e "${CYAN_B}Would you like to clear unused package caches? (y/N)${RESET}\n"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -e "${PURPLE}Freeing up disk space...${RESET}"
  sudo pacman -Sc --noconfirm
  paccache -r
fi

# Prompt user to install all listed apps
echo -e "${CYAN_B}Would you like to install listed apps? (y/N)${RESET}\n"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -e "${PURPLE}Starting install...${RESET}"
  for app in ${pacman_apps[@]}; do
    if hash "${app}" 2> /dev/null; then
      echo -e "${YELLOW}[Skipping]${LIGHT} ${app} is already installed${RESET}"
    elif [[ $(echo $(pacman -Qk $(echo $app | tr 'A-Z' 'a-z') 2> /dev/null )) == *"total files"* ]]; then
      echo -e "${YELLOW}[Skipping]${LIGHT} ${app} is already installed via Pacman${RESET}"
    elif hash flatpak 2> /dev/null && [[ ! -z $(echo $(flatpak list --columns=ref | grep $app)) ]]; then
      echo -e "${YELLOW}[Skipping]${LIGHT} ${app} is already installed via Flatpak${RESET}"
    else
      echo -e "${PURPLE}[Installing]${LIGHT} Downloading ${app}...${RESET}"
      sudo pacman -S ${app} --needed --noconfirm
    fi
  done
fi

echo -e "${PURPLE}Finished installing / updating Arch packages.${RESET}"

