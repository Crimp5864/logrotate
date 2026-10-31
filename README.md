# Logrotate for personal logs

This is a standalone Logrotate configuration for per user logs only.

## Summary

Logrotate handles system logs by default. User logs can be managed in this fashion but having a user specific \
configuration grants full control to the user, especially in cases where the user is not an administrator. The \
only requirements are the logrotate package (Linux) or Log-Rotate PowerShell module (Windows). No \
administrative permission is required.

## Linux

### Install

```bash
# Clone the repository.
git clone https://github.com/Crimp5864/logrotate

# Navigate into the repository.
cd logrotate

# Install files.
./install
```

### Files

- Systemd: ~/.config/systemd/user/
    - logrotate.service
    - logrotate.timer
- Configuration: ~/.config/logrotate/
    - logrotate.conf
- Status: ~/.local/state/logrotate/
    - logrotate.status


## Windows

### Install

```bash
# Placeholder for installation instructions
```

### Files

- 
