#!/bin/bash

# What is Apache?
# Apache HTTP Server is a web server used to serve websites and HTTP applications.
# It listens on a TCP port and accepts HTTP requests from clients.

# In this lab, Apache needs to be reachable on port 8088.
# Check if Apache is running
sudo systemctl status httpd

# Start Apache and enable it at boot
sudo systemctl start httpd
sudo systemctl enable httpd

# Check which process is listening on port 8088
sudo ss -tulpn | grep :8088
# Apache must be the process listening on port 8088.
# If another service is already using the port, Apache cannot bind to it.

# Test Apache locally
curl http://localhost:8088
# If this works, Apache itself is running correctly.

# A remote connection can still fail because of a firewall.
# What is iptables?
# iptables is a Linux firewall used to control network traffic.
# INPUT  = incoming traffic to the server
# OUTPUT = outgoing traffic from the server
# FORWARD = traffic passing through the server
# Common actions:
# ACCEPT = allow traffic
# DROP   = silently block traffic
# REJECT = block traffic and notify the sender

# View the current firewall rules
sudo iptables -L -n
# Rules are processed from top to bottom.
# A broad REJECT rule can block traffic if no earlier rule allows it.

# Allow incoming TCP connections to Apache on port 8088
sudo iptables -I INPUT -p tcp --dport 8088 -j ACCEPT
# -I INPUT      = insert the rule at the beginning of INPUT
# -p tcp        = match TCP traffic
# --dport 8088  = match traffic going to port 8088
# -j ACCEPT     = allow the traffic

# Verify the rule
sudo iptables -L INPUT -n --line-numbers

# Save the current iptables rules so they survive a reboot
sudo iptables-save | sudo tee /etc/sysconfig/iptables
# The iptables service loads the rules from /etc/sysconfig/iptables.

# Final test from the Jump Host
curl http://stapp01:8088
# If Apache is running, listening on 8088, and the firewall allows
# the port, the Apache page should be reachable from the Jump Host.
