#!/usr/bin/bash
# Enable Security-Enhanced Linux

# Install utilities
sudo yum install selinux-policy-targeted -y

# Set mode to enforce
sudo setenforce 1


# Persistent Change: To keep it after reboot, edit /etc/selinux/config and set SELINUX=enforcing.

# Troubleshooting: Use sestatus to verify the current mode.