# Logrotate for personal logs

This is a standalone Logrotate configuration for per user logs only. File names
reflect those of the defaults such as 'logrotate.conf' and 'logrotate.status'.

## Linux

### Install

1. **Clone the repository:**
    ```bash
    git clone https://github.com/Crimp5864/logrotate
    ```
2. **Navigate to directory:**
    ```bash
    cd logrotate
    ```
3. **Install files:**
   ```bash
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

### Files
