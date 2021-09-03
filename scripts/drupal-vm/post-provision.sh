#!/bin/bash
#
# Example shell script to run post-provisioning.
#
# This script sets up BLT Launcher as part of the VM so that `blt` is available within the VM gobaly
# see https://github.com/acquia/blt-launcher for more details on BLT Launcher

BLT_LAUNCHER_DOWNLOAD="https://github.com/acquia/blt-launcher/releases/latest/download/blt.phar"
BLT_LAUNCHER_DOWNLOAD_DIR="/tmp"
BLT_LAUNCHER_INSTALL_PATH="/usr/local/bin/blt"
BLT_LAUNCHER_SETUP_COMPLETE_FILE="/etc/BLT_launcher_config_complete"


# Check to see if we've already performed this setup.
if [ ! -e "$BLT_LAUNCHER_SETUP_COMPLETE_FILE" ]; then
  # Download the BLT Launcher phar.
  wget -qO $BLT_LAUNCHER_DOWNLOAD_DIR/blt.phar $BLT_LAUNCHER_DOWNLOAD
  
  # Give execute permissions to blt.phar
  chmod +x /tmp/blt.phar
  
  # Rename blt.phar to blt and move it to /usr/local/bin/blt a location in $PATH
  sudo mv /tmp/blt.phar /usr/local/bin/blt
else
  exit 0
fi
