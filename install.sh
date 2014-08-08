#!/bin/bash

#This script is to help download & install useful software personally.

cd ~/Downloads

#Enable the universe and multiverse repositories
echo "Adding main/universe/multiverse repositories..." &&
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe multiverse" &&

#Installing aptitude
#echo "Installing Aptitude..." &&
#sudo apt-get install aptitude --yes > /dev/null &&

#Update packages
echo "Updating package database..." &&
sudo apt-get update --yes > /dev/null &&

#Remove Firefox
echo "Removing Firefox..." &&
sudo apt-get remove --purge firefox --yes > /dev/null &&
sudo apt-get remove --purge firefox-locale-en --yes > /dev/null &&

#Remove Thunderbird
echo "Removing Thunderbird..." &&
sudo apt-get remove --purge thunderbird --yes > /dev/null && 
sudo apt-get remove --purge thunderbird-globalmenu --yes > /dev/null && 
sudo apt-get remove --purge thunderbird-gnome-support --yes > /dev/null && 
sudo apt-get remove --purge thunderbird-locale-en --yes > /dev/null && 
sudo apt-get remove --purge thunderbird-locale-en-us --yes > /dev/null &&

#Remove Libre Office
echo "Removing Libre Office..." &&
sudo apt-get remove --purge libreoffice-base-core --yes > /dev/null &&
sudo apt-get remove --purge libreoffice-core --yes > /dev/null &&
sudo apt-get remove --purge libreoffice-common --yes > /dev/null &&
sudo apt-get remove --purge libreoffice-style-human --yes > /dev/null &&

#Disable web advertisements in dash
echo "Disabling web advertizements in dash..." &&
wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash > /dev/null &&

#Reset resolvconf (I've had issues connecting to the internet right out of the box)
echo "Resetting resolvconf..." &&
sudo apt-get remove --purge resolvconf --yes > /dev/null && 
sudo apt-get install --reinstall resolvconf --yes > /dev/null &&

#Install Google Chrome dependencies
echo "Installing Google Chrome dependencies..." &&
sudo apt-get install libxss1 --yes > /dev/null &&

#Install Qt dependencies
echo "Installing Qt dependencies..." &&
sudo apt-get install mesa-common-dev --yes > /dev/null &&
sudo apt-get install libglu1-mesa-dev --yes > /dev/null &&

#Install ADT dependencies
echo "Instsalling ADT Bundle dependencies"
sudo apt-get install openjdk-7-jdk --yes > /dev/null &&

#Install Qt && Google Chrome
if [[ $(getconf LONG_BIT) = "64" ]]
then
	echo "64bit Detected" &&
	echo "Installing Qt" &&
	wget http://download.qt-project.org/official_releases/qt/5.3/5.3.0/qt-opensource-linux-x64-5.3.0.run /dev/null &&
	sudo chmod +x qt-opensource-linux-x64-5.3.0.run > /dev/null &&
	sudo ./qt-opensource-linux-x64-5.3.0.run > /dev/null &&
	sudo rm qt-opensource-linux-x64-5.3.0.run > /dev/null &&

	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb > /dev/null &&
	sudo rm google-chrome-stable_current_amd64.deb > /dev/null &&

	echo "Downloading and installing ADT Bundle" &&
	sudo apt-get install libgl1-mesa-dev:i386 --yes > /dev/null &&
	wget http://dl.google.com/android/adt/adt-bundle-linux-x86_64-20140702.zip > /dev/null &&
	sudo unzip adt-bundle-linux-x86_64-20140702.zip > /dev/null &&
	sudo mv adt-bundle-linux-x86_64-20140702 ADT > /dev/null &&
	sudo mv ADT /opt/ > /dev/null
	
else
	echo "32bit Detected" &&
	echo "Installing Qt" &&
	wget http://download.qt-project.org/official_releases/qt/5.3/5.3.0/qt-opensource-linux-x86-5.3.0.run > /dev/null &&
	sudo chmod +x qt-opensource-linux-x86-5.3.0.run > /dev/null &&
	sudo ./qt-opensource-linux-x86-5.3.0.run > /dev/null &&
	sudo rm qt-opensource-linux-x86-5.3.0.run > /dev/null &&

	echo "Installing Google Chrome" > /dev/null &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb > /dev/null &&
	sudo dpkg -i google-chrome-stable_current_i386.deb --yes > /dev/null &&
	sudo rm google-chrome-stable_current_i386.deb > /dev/null &&

	echo "Downloading and installing ADT Bundle" &&
	sudo apt-get install libgl1-mesa-dev --yes > /dev/null &&
	wget http://dl.google.com/android/adt/adt-bundle-linux-x86-20140702.zip > /dev/null &&
	sudo unzip adt-bundle-linux-x86-20140702.zip > /dev/null &&
	sudo mv adt-bundle-linux-x86-20140702 ADT > /dev/null &&
	sudo mv ADT /opt/ > /dev/null
fi

#Add ADT directories to PATH
PATH=${PATH}:/opt/ADT/sdk/tools > /dev/null &&
PATH=${PATH}:/opt/ADT/sdk/platform-tools > /dev/null &&
PATH=${PATH}:/opt/ADT/eclipse > /dev/null &&
sudo echo "PATH DEFAULT=${PATH}" >> ~/.pam_environment &&

#Install Git
echo "Installing Git..." &&
sudo apt-get install git --yes > /dev/null &&

#Install build-essential package (mostly for GCC)
echo "Installing build-essential package..." &&
sudo apt-get install build-essential --yes > /dev/null &&

#Install VLC media player
echo "Installing VLC Media Player..." &&
sudo apt-get install vlc --yes > /dev/null &&

#Install 'foremost' and 'scalpel' forensic tools
echo "Installing Foremost and Scalpel..." &&
sudo apt-get install foremost --yes > /dev/null &&
sudo apt-get install scalpel --yes > /dev/null &&

#Install general developement/execution packages
echo "Installing misc. needed packages..." &&
sudo apt-get install lib32z1 --yes > /dev/null &&
sudo apt-get install lib32ncurses5 --yes > /dev/null &&
sudo apt-get install lib32bz2-1.0 --yes > /dev/null &&
sudo apt-get install lib32stdc++6 --yes > /dev/null &&

#Remove unecessary packages
echo "Removing unecessary packages..." &&
sudo apt-get autoremove --yes > /dev/null &&

#Upgrade all packages
echo "Upgrading installed packages..." &&
sudo apt-get upgrade --yes > /dev/null 
