#!/usr/bin/bash
# Create a user that expires on Dec 31st, 2024

sudo useradd -e 2024-12-31 temp_auditor

# You can check the account's expiration status by using the chage command.
# Specifically, chage -l followed by the username will show you:
    # all the password and account aging information, including the expiration date.