#!/usr/bin/env bash
# This script teaches you how to troubleshoot MariaDB service issues on a Linux system.
# It covers common problems, error messages, and solutions to help you get your MariaDB service up and running smoothly.

# Troubleshooting Steps:
# 1. Check the status of the MariaDB service
sudo systemctl status mariadb


# 2. View the last 50 lines of the error log
sudo tail -n 50 /var/log/mysql/error.log

# In case the error log is not found, you can check the journal logs for MariaDB service
# 3. Check the MariaDB error log for any error messages
    # You can see errors only by adding "-p err" to the cmd
    # You can retrive last n lines of the log by adding "-n 50" to the cmd
sudo journalctl -u mariadb
