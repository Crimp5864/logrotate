# Logrotate for personal logs

This is a standalone Logrotate configuration for per user logs only. File names
reflect those of the defaults such as 'logrotate.conf' and 'logrotate.status'.

## Files

- Systemd: ~/.config/systemd/user/
    - logrotate.service
    - logrotate.timer
- Configuration: ~/.config/logrotate/
    - logrotate.conf
- Status: ~/.local/state/logrotate/
    - logrotate.status
