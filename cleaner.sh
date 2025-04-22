#!/bin/bash

# Set log file path
LOG_FILE="/var/log/cleaner.log"

# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}

# Display welcome message
log_message "===== System Cleanup Started ====="
log_message "Welcome to Cleaner — your professional system maintenance assistant."
log_message "Thank you for using Cleaner. Beginning system cleanup process..."

# Start of the process
log_message "Start time: $(date '+%Y-%m-%d %H:%M:%S')"
log_message "Updating package list..."
apt update -y >> $LOG_FILE 2>&1

log_message "Upgrading installed packages..."
apt upgrade -y >> $LOG_FILE 2>&1

log_message "Notice: Checking for upgradable packages..."
UPGRADEABLE_PACKAGES=$(apt list --upgradable 2>/dev/null)

if [ -z "$UPGRADEABLE_PACKAGES" ]; then
    log_message "No packages available for upgrade."
else
    log_message "Upgradable packages detected:"
    echo "$UPGRADEABLE_PACKAGES" | tee -a $LOG_FILE
fi

log_message "Removing unused packages..."
apt autoremove -y >> $LOG_FILE 2>&1

log_message "Cleaning up package cache..."
apt clean >> $LOG_FILE 2>&1

log_message "Deleting old log files..."
find /var/log -type f -iname "*.log" -exec rm -f {} \;

log_message "Clearing APT archive cache..."
rm -rf /var/cache/apt/archives/* >> $LOG_FILE 2>&1

log_message "Cleaning temporary files..."
rm -rf /tmp/* >> $LOG_FILE 2>&1

log_message "Cleaning systemd journal logs (keeping last 3 days)..."
journalctl --vacuum-time=3d >> $LOG_FILE 2>&1

log_message "System cleanup completed successfully."
log_message "End time: $(date '+%Y-%m-%d %H:%M:%S')"
log_message "=================================="
