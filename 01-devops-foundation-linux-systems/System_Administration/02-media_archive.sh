#!/usr/bin/env bash
# This script is designed to help you archive media files on a Linux system.
# It provides a simple way to compress and move media files to a specified archive directory.

# Tasks:
    # The production support team of xFusionCorp Industries is working on developing some bash scripts
        # to automate different day to day tasks.
        # One is to create a bash script for archiving website content files.
        # They have a static website running on App Server 1 in Stratos Datacenter,
        # and they need to create a bash script named media_archive.sh which should accomplish the following tasks.
        # (Also remember to place the script under the /scripts directory on App Server 1).
    # a. Create a zip archive named xfusioncorp_media.zip of /var/www/html/media directory.
    # b. Save the archive in the /archives/ directory on the App Server 1.
        # This is a temporary storage, as archives from this location will be cleaned on a weekly basis.
        # Therefore, the archive should also be copied to the Nautilus Storage Server so it can be retrieved later for validation purposes.
    # c. Copy the created archive to the Nautilus Storage Server server in the /archives/ location.
    # d. Please make sure script won't ask for password while copying the archive file.
        # Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

    # e. Do not use sudo inside the script.
    # Note: The zip package must be installed on given App Server before executing the script.
        # This package is essential for creating the zip archive of the website files. Install it manually outside the script.

# step 0: create an ssh key pair on App Server 1 and copy the public key to Nautilus Storage Server
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
ssh-copy-id tony@nautilus-storage-server

# Step 1: Create a zip archive of the /var/www/html/media directory
zip -r /archives/xfusioncorp_media.zip /var/www/html/media

# Step 2: Copy the created archive to the Nautilus Storage Server
scp /archives/xfusioncorp_media.zip tony@nautilus-storage-server:/archives

# Step 3: Verify the copy operation
if [ $? -eq 0 ]; then
    echo "Archive copied successfully to Nautilus Storage Server."
else
    echo "Error occurred while copying the archive to Nautilus Storage Server."
fi

