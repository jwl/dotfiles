#!/bin/bash
# migrate-kde.sh
# Safely migrate KDE configs from a dotfiles repo to a new system
# Run this from the HOME DIRECTORY!

set -euo pipefail

# === CONFIGURATION ===
DOTFILES_DIR=~/dotfiles            # path to your dotfiles repo
BACKUP_DIR=~/kde-config-backup-$(date +%Y%m%d%H%M%S)
EXCLUDE_FILES=("kdeconnect")       # sensitive dirs/files to skip

echo "Starting KDE config migration..."
echo "Dotfiles directory: $DOTFILES_DIR"
echo "Backup directory: $BACKUP_DIR"

# === Step 1: Backup existing KDE configs ===
echo "Backing up existing KDE configs..."
mkdir -p "$BACKUP_DIR"
if [ -d "$HOME/.config" ]; then
    cp -r ~/.config "$BACKUP_DIR/config"
fi
if [ -d "$HOME/.local/share/plasma" ]; then
    cp -r ~/.local/share/plasma "$BACKUP_DIR/local-share-plasma"
fi

# === Step 2: Symlink dotfiles, skipping excluded items ===
echo "Symlinking dotfiles..."
# Symlink everything under ~/.config
for file in "$DOTFILES_DIR"/.config/*; do
    filename=$(basename "$file")
    skip=false
    for ex in "${EXCLUDE_FILES[@]}"; do
        if [[ "$filename" == "$ex" ]]; then
            skip=true
            break
        fi
    done
    if [ "$skip" = true ]; then
        echo "Skipping sensitive config: $filename"
        continue
    fi
    target="$HOME/.config/$filename"
    [ -e "$target" ] && rm -rf "$target"
    ln -s "$file" "$target"
    echo "Linked $filename → $target"
done

echo "✅ KDE config migration complete!"
echo "Backup of original configs is stored at: $BACKUP_DIR"
echo "Log out and log back in for changes to take effect."
