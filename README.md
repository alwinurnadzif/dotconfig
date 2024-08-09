# DotConfig

Welcome to the DotConfig repository! This repository contains a collection of configuration files for various development tools and environments.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)

## Introduction

DotConfig provides configurations for:

- **Neovim**: A highly extensible text editor.
- **Kitty**: The fast, feature-rich, GPU based terminal emulator
- **zsh**: Shell designed for interactive use

## Installation

1. Clone the repository:

```bash
git clone https://github.com/alwinurnadzif/dotconfig.git
```

2. Navigate to the directory

```bash
cd dotconfig
```

3. Create symbolic links for configuration lines

```bash

ln -s ~/dotconfig/nvim ~/.config/nvim
ln -s ~/dotconfig/kitty ~/.config/kitty
```

4. Load zsh config to .zshrc

```bash
# Aliases
if [ -f ~/dotconfig/zsh/zsh_aliases ]; then
  source ~/dotconfig/zsh/zsh_aliases
fi

# Paths
if [ -f ~/dotconfig/zsh/zsh_paths ]; then
  source ~/dotconfig/zsh/zsh_paths
fi

# Functions
if [ -f ~/dotconfig/zsh/zsh_functions ]; then
  source ~/dotconfig/zsh/zsh_functions
fi

```
