#!/usr/bin/bash
# Secure Root SSH Access

# Edit the config file

sudo vi /etc/ssh/sshd_config

# Change 'PermitRootLogin yes' to:

PermitRootLogin no

# Restart the service

sudo systemctl restart sshd
