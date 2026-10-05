#!/bin/bash
# for this script we're required to troubleshoot apache server, we're going to focus on the process sectiononly

# Troubleshooting Steps:
# 1. Check if the Apache service is running
sudo systemctl status httpd

# 2. If the service is not running, start it
sudo systemctl start httpd

# 3. check the port where apache is suppose to be running
sudo cat /etc/httpd/conf/httpd.conf | grep Listen

# 4. Check if the port is open and listening using netstat | ss | top
sudo netstat -tuln | grep :80
sudo ss -tuln | grep :80
sudo top -b -n1 | grep :80

# 5. If the port is open and other process is using it, we can kill the process using the following command
sudo kill -15 <PID>  # this will send a SIGTERM signal to the process, allowing it to terminate gracefully. If the process does not terminate, you can use the following command to forcefully kill it:
sudo kill -9 <PID>  # Use this is if the process does not terminate gracefully with SIGTERM. This sends a SIGKILL signal, which forcefully terminates the process without allowing it to clean up.

# but as a safer option, we can use the following command to stop the process gracefully:
sudo systemctl stop <service_name>  # Replace <service_name> with the name of
    
# Now we can start the apache service again
sudo systemctl start httpd
