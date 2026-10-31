#!/usr/bin/env bash

# --- Synopsis ---
# Install script for per user log rotate configuration
#
# Files: logrotate.conf, logrotate.status, logrotate.service, logrotate.timer
# Configure logrotate.conf

# --- Requirements ---
# This utility requires non-root operation.
if [[ "$EUID" -eq 0 ]]; then
  echo -e "\e[1;31mError: Do not run this script as root.\e[0m" >&2
  exit 1
fi

# This utility requires systemd.
if [[ ! -d "/run/systemd/system" ]]; then
  echo -e "\e[1;31mError: This system does not use systemd. Aborting.\e[0m" >&2
  exit 1
fi

# This utility requires logrotate.
if ! command -v logrotate &> /dev/null; then
  echo -e "\e[1;31mError: 'logrotate' is required but not installed.\e[0m" >&2
  exit 1
fi

# --- Variables ---
# Script
script_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script_name="${0##*/}"
log_file="install.log"

# Source
src_dir="$script_root/linux"

# Destination
config_dir="$HOME/.config/logrotate"
state_dir="$HOME/.local/state/logrotate"
systemd_dir="$HOME/.config/systemd/user"
dest_dirs=(
  "$config_dir"
  "$state_dir"
  "$systemd_dir"
) 
config_file="logrotate.conf"
state_file="logrotate.status"
service_file="logrotate.service"
timer_file="logrotate.timer"
systemd_units=(
  "$service_file"
  "$timer_file"
)

# --- Functions ---
log() {
  local message="$1"
  echo -e "$message" | tee --append "$script_root/$log_file"
}

fail() {
  local message="$1"
  log "\e[31m$message\e[0m" >&2
  exit 1
}

# --- Pre-Flight Checks ---
# Initialize log file
: > "$script_root/$log_file"

# --- Main Process ---

log "Starting $script_name for user level logrotate\n"

# Create directories
for dir in "${dest_dirs[@]}"; do
  # Skip if it exists.
  [[ -d "$dir" ]] && log "Directory $dir exists." && continue

  # Attempt to create if it does not exist.
  log "Creating directory $dir"
  mkdir --parents "$dir" &> /dev/null \
    || fail "Error creating directoy $dir."
done
echo

# Copy config file
if [[ -e "$config_dir/$config_file" ]]; then
  log "File $config_file exists."
else
  log "Copying file $config_file."
  cp "$src_dir/$config_file" "$config_dir/$config_file" &> /dev/null \
    || fail "Error copying file $config_file."
fi

# Create state file
if [[ -e "$state_dir/$state_file" ]]; then
  log "File $state_file exists."
else
  log "Creating file $state_file"
  touch "$state_dir/$state_file" &> /dev/null \
    || fail "Error creating file $state_file"
fi

# Copy systemd files
for unit in "${systemd_units[@]}"; do
  # Skip if it exists.
  [[ -e "$src_dir/$unit" ]] && log "File $unit exists." && continue

  # Attempt to create if it does not exist.
  log "Copying file $unit"
  cp "$src_dir/$unit" "$systemd_dir/$unit" &> /dev/null \
    || fail "Error copying file $unit"
done

# Enable systemd units
log "\nReloading systemd daemons"
systemctl --user daemon-reload || fail "Error reloading daemons"

if systemctl --user is-enabled "$timer_file" &> /dev/null; then
  log "Restarting $timer_file"
  systemctl --user restart "$timer_file"
else
  log "Enabling and starting $timer_file"
  systemctl --user --now enable "$timer_file"
fi

echo -e "\nCheck $config_file configuration"
