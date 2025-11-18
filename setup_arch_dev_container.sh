#!/usr/bin/env bash

set -e  # Exit on error

# Prompt user for confirmation
echo "WARNING!"
echo
echo "This script requires that you have already symlinked the .config directory and .zshrc config file before hand!"
echo
read -p "Have you already symlinked both? [y/N] " response

# Default to N if empty
response=${response:-N}

if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo "Aborting. Please symlink .config and .zshrc before running this script."
    exit 1
fi

# --- Main script starts here ---

# Update system
sudo pacman -Syu --noconfirm

# Install essential build tools and git
sudo pacman -S --needed --noconfirm base-devel git

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Load cargo env (needed so rustup & cargo are in PATH during script)
source "$HOME/.cargo/env"

# Install Rust beta toolchain
rustup default beta

# Create ~/aur directory if it does not exist
AUR_DIR="$HOME/aur"
mkdir -p "$AUR_DIR"

# Install or update paru
if command -v paru >/dev/null 2>&1; then
    echo "paru is already installed. Updating paru..."
    paru -Syu --noconfirm
else
    echo "paru is not installed. Installing paru from AUR..."
    cd "$AUR_DIR"
    if [ ! -d "paru" ]; then
        git clone https://aur.archlinux.org/paru.git
    fi
    cd paru
    makepkg -si --noconfirm
fi

# Future steps can continue here
echo "Setup complete. You can add more commands below."

