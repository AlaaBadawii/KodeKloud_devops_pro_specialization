#!/bin/bash

# This script teaches you how to install and configure iptables on a Linux system.
# It covers the installation process, basic configuration, and common commands to manage iptables rules.

# Installation Steps:
# 1. Update the package list
sudo apt-get update

# 2. Install iptables
sudo apt-get install iptables iptables-services -y

# 3. Verify the installation
sudo iptables --version

# 4. Start the iptables service
sudo systemctl start iptables

# 5. Enable iptables to start on boot
sudo systemctl enable iptables

# 6. Check the status of the iptables service
sudo systemctl status iptables

# 7. Basic iptables commands:
# - List all current rules
sudo iptables -L -v -n

# Note: The above command lists all current iptables rules with verbose output and numeric format.
# Note: commands are being read from top to bottom, so the order of the rules matters. The first matching rule will be applied, and subsequent rules will be ignored.

# - Add a rule to allow incoming SSH connections
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# - Add a rule to allow incoming HTTP connections
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# - Add a rule to allow incoming HTTPS connections
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Note: The above commands add rules to the INPUT chain to allow incoming connections on the specified ports.

# If you want to allow incoming connections from a specific IP address, you can use the following command:
# - Allow incoming connections from a specific IP address (replace <IP_ADDRESS> with the actual IP address)
sudo iptables -A INPUT -s <IP_ADDRESS> -j ACCEPT

# - Drop all other incoming connections
sudo iptables -A INPUT -j DROP

# 8. Save the iptables rules
sudo iptables-save | sudo tee /etc/iptables/rules.v4
