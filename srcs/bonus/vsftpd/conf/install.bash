#!/bin/bash

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Please use 'sudo' or run as root user."
    exit 1
fi

# Define the FTP username and password
FTP_USERNAME="ven"
FTP_PASSWORD="your_password_here"

# Set the new home directory for the FTP user
NEW_HOME_DIRECTORY="/var/www/html"

# Create a new FTP user with the specified home directory
useradd -m -d "$NEW_HOME_DIRECTORY" -s /bin/bash $FTP_USERNAME

# Set a password for the FTP user
echo "Setting a password for $FTP_USERNAME:"
passwd $FTP_USERNAME << EOF
$FTP_PASSWORD
$FTP_PASSWORD
EOF

# Verify that the password was updated successfully
if [ $? -ne 0 ]; then
    echo "Password update failed. Please try again."
    exit 1
fi

# Create the /var/run/vsftpd/empty directory
echo "Creating /var/run/vsftpd/empty directory:"
mkdir -p /var/run/vsftpd/empty

# Set proper permissions on the directory
chmod 555 /var/run/vsftpd/empty

# Verify that the directory has the correct permissions
ls -ld /var/run/vsftpd/empty

# Exit the script
exec "$@"
