#!/bin/bash

# This script is intended to be used for updating the Samba package to later version. Please consult https://www.cvedetails.com/vulnerability-list/vendor_id-102/Samba.html before running this script to ensure that the upgrade is absolutely necessary.

# Remove existing Samba install in your machine.
sudo apt-get remove samba
sudo apt-get autoremove

read -p "Please go to https://www.samba.org/samba/ftp/stable to find the version of samba you wish to install and enter it here: " samba_version
echo Example: samba-4.7.12.tar.gz


wget http://www.samba.org/samba/ftp/stable/$samba_version
tar xvfz $samba_version

# Ensure the necessary build tools are installed.
sudo apt-get install build-essential python-dev checkinstall expect

# Configure necessary Samba files
cd $samba_version
./configure

while true
do
	read -p "Was the configuration successful (yes or no)?" choice
	case "$choice" in

	yes|Yes) echo "Installing Samba..."
			 break;;
	
	no|No) read -p "Please enter the package you would like to install: " package
		   sudo apt-get install $package
		   ./configure;;
	esac
done

# Build Samba
sudo make


# Use checkinstall to install Samba
echo "In the following menu please replace the [2] and [11] options with $samba_version."
sudo checkinstall

# Add Samba to the manpages directory
cd 

# Add Samba file to system environment variable and sudoers file
echo "Edit /etc/sudoers and /etc/environment to add /usr/local/samba/bin and /usr/local/samba/sbin to the path. Also edit /etc/manpath.config to add /usr/local/samba/share/man to the main path.





		   


	
