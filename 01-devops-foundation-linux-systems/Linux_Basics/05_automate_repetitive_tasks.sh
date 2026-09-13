#!/usr/bin/bash

# first check if cron is installed
rpm -q cronie

# if not installed, install it
sudo yum install cronie -y

# Open crontab editor

crontab -e

# Once inside the editor, you can add cron jobs in a new line. e.g.
# Add this line to run a script every day at midnight

0 0 * * * /home/ubuntu/scripts/daily_backup.sh

# the 1st field is for minutes (0-59)
# the 2nd field is for hours (0-23)
# the 3rd field is for day of the month (1-31)
# the 4th field is for month (1-12)
# the 5th field is for day of the week (0-7) where both 0 and 7 represent Sunday
# the 6th field is the command to execute

# you can also run the script every 5 minutes by using */5 in the first field:
# */5 * * * * /home/ubuntu/scripts/daily_backup.sh
# same goes for hours, days, months, and weekdays.
# */N means "every N units" of whichever field you put it in.


# Key Points & Execution:
    # Paths: Always use absolute paths (e.g., /usr/bin/python3) because cron runs with a very basic environment.
    # Logging: Append >> /var/log/cron_output.log 2>&1 to your command to capture errors, to be reviewed later.
    # This cmd will redirect both stdout and stderr to the specified log file.