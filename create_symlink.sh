#!/usr/bin/env bash

create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Warning: $target already exists, skipping..."
    else
        echo "Creating symlink: $target -> $source"
        ln -s "$source" "$target"
    fi
}

# Create config directory if it doesn't exist
mkdir -p ~/.config

# Create symlinks
create_symlink ~/workspaces/dotfiles/aerospace ~/.config/aerospace
create_symlink ~/workspaces/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
create_symlink ~/workspaces/dotfiles/tmux/.tmux.conf ~/.tmux.conf
create_symlink ~/workspaces/dotfiles/git/.gitconfig ~/.gitconfig
create_symlink ~/workspaces/dotfiles/zsh/.zshrc ~/.zshrc
create_symlink ~/workspaces/dotfiles/ideavim/.ideavimrc ~/.ideavimrc

echo "Symlink creation completed!"
