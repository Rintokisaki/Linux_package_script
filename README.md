# Unified Package Installer (pacman → yay)

## Overview

This project provides a Bash automation script for Arch Linux–based systems that installs packages from a single unified list.

For each package, the script follows this logic:

1. Skip the package if it is already installed  
2. Install using pacman if the package exists in official repositories  
3. Fall back to yay (AUR) if the package is not found in pacman  

This approach ensures clean automation, minimal duplication, and preference for official repositories.

---

## Features

- Single unified package list
- Automatic detection of already installed packages
- pacman-first, AUR-fallback logic
- Automatic installation of `yay` if missing
- Non-interactive execution
- Safe to run multiple times (idempotent)

---

## Requirements

- Arch Linux or Arch-based distribution
- `sudo` privileges
- Active internet connection

---

## Script Logic (High-Level)

For each package in the list:

1. Check if the package is already installed using `pacman -Qi`
2. If installed, skip it
3. If available in pacman repositories (`pacman -Si`), install via pacman
4. Otherwise, install from the AUR using yay

---

## Installation

### Clone the Repository

```bash
git clone https://github.com/your-username/unified-package-installer.git
cd unified-package-installer
