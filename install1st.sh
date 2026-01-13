#!/bin/bash

set -e

# -------------------------------
# Unified package list
# -------------------------------

PACKAGES=( 
	fakeroot
        spotify-launcher
        go
        nmap
        dsniff
        fastfetch
        wireshark-qt
        sqlmap
        burpsuite
        hashcat
        hydra
        metasploit
        maltego
        netcat
        aircrack-ng
        dirb
        subfinder
        crunch
	gobuster
	ghidra
	visual-studio-code-bin  
	openvpn
	plex-media-server  

)

# -------------------------------
# Ensure yay is installed
# -------------------------------

if ! command -v yay >/dev/null 2>&1; then
    echo "yay not found. Installing yay..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# -------------------------------
# Update system
# -------------------------------

sudo pacman -Syu --noconfirm

# -------------------------------
# Install packages
# -------------------------------

for pkg in "${PACKAGES[@]}"; do
    echo "Processing package: $pkg"

    # ---- Exception: already installed ----
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        echo "Package already installed. Skipping."
        continue
    fi

    # ---- Check official repository ----
    if pacman -Si "$pkg" >/dev/null 2>&1; then
        echo "Installing from pacman repository..."
        sudo pacman -S --noconfirm "$pkg"
    else
        echo "Installing from AUR using yay..."
        yay -S --noconfirm "$pkg"
    fi
done

echo "All specified packages have been processed successfully."

