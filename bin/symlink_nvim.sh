#!/bin/bash

# ---- Cd to this file's dir ----
CURRENT_DIR=$(pwd)
SCRIPTS_DIR=$(dirname $(realpath "$0"))

cd $SCRIPTS_DIR

if command -v nvim &>/dev/null; then
  # link config
  CONFIG_PATH=$HOME/.config/nvim
  TARGET_PATH=$(realpath "$SCRIPTS_DIR/../nvim")
  if [ -e "$CONFIG_PATH" ]; then
	  echo "[OK] $CONFIG_PATH already exists. Removing"
	  rm -rf "$CONFIG_PATH"
  fi
  
  ln -s $TARGET_PATH $CONFIG_PATH 
  echo "[OK] Created symlink"
else
  echo "[OK] Neovim is not installed"
fi

# ---- Cd back to the original dir ----
cd $CURRENT_DIR
