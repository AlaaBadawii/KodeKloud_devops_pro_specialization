#!/bin/bash
# This script is designed to help you install and configure the Tomcat server on a Linux system.
# It provides a simple way to set up the Tomcat server and ensure it is running properly

# What is Tomcat?
# Tomcat is an open-source web server and servlet container developed by the Apache Software Foundation.
# It is used to serve Java-based web applications and provides a platform for running Java Servlets
# and JavaServer Pages (JSP). Tomcat is widely used in the industry for deploying Java web applications and is known for its simplicity, performance, and scalability.

# first , we need to update the package index and install the necessary dependencies for Tomcat
sudo apt update
sudo apt install -y default-jdk wget

# Next, we will download the latest version of Tomcat from the official Apache website. We will use yum  to download it.
sudo install tomcat -y

# After the installation is complete, we will start the Tomcat service and enable it to start on boot.
sudo systemctl start tomcat
sudo systemctl enable tomcat

# Finally, we will verify that the Tomcat server is running properly by checking its status and accessing the default Tomcat page in a web browser.
sudo systemctl status tomcat

# Let's say you have a Java application that you want to deploy on the Tomcat server. You can do this by copying the WAR file of your application to the Tomcat webapps directory. For example, if your WAR file is named myapp.war, you can copy it to the webapps directory using the following command:
sudo cp myapp.war /var/lib/tomcat/webapps/
# or
sudo cp myapp.war /opt/tomcat/webapps/
# or
sudo cp myapp.war /usr/share/tomcat/webapps/

# By default, Tomcat runs on port 8080. You can access your deployed application by opening a web browser and navigating to http://localhost:8080/myapp (replace "myapp" with the name of your application). If everything is set up correctly, you should see your application running in the browser.
curl http://localhost:8080/myapp

# To run your application as the root, name your file name as ROOT.war and copy it to the webapps directory. This will make your application accessible at http://localhost:8080/ without specifying the application name in the URL.
curl http://localhost:8080/

# What if you want to change the default port of Tomcat? You can do this by editing the server.xml file located in the Tomcat configuration directory. Open the file using a text editor and look for the following line:
# <Connector port="8080" protocol="HTTP/1.1"
# Change the port number to your desired value (for example, 9090) and save the file. After making this change, you will need to restart the Tomcat service for the changes to take effect. You can do this using the following command:
sudo systemctl restart tomcat