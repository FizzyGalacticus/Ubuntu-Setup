#!/bin/bash

#This script is to help download & install useful software personally.

cd ~/Downloads

#Remove Firefox
sudo apt-get remove --purge firefox --yes &&
sudo apt-get remove --purge firefox-locale-en --yes &&

#Remove Thunderbird
sudo apt-get remove --purge thunderbird --yes && 
sudo apt-get remove --purge thunderbird-globalmenu --yes && 
sudo apt-get remove --purge thunderbird-gnome-support --yes && 
sudo apt-get remove --purge thunderbird-locale-en --yes && 
sudo apt-get remove --purge thunderbird-locale-en-us --yes &&

#Remove Libre Office
sudo apt-get remove --purge libreoffice-base-core --yes &&
sudo apt-get remove --purge libreoffice-core --yes &&
sudo apt-get remove --purge libreoffice-common --yes &&
sudo apt-get remove --purge libreoffice-style-human --yes &&

#Disable web advertisements in dash
wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash &&

#Reset resolvconf (I've had issues connecting to the internet right out of the box)
sudo apt-get remove --purge resolvconf --yes && 
sudo apt-get install --reinstall resolvconf --yes &&

#Enable the universe and multiverse repositories
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe multiverse" &&

#Update packages
sudo apt-get update --yes &&

#Install Google Chrome dependencies
sudo apt-get install libxss1 --yes &&

#Install Qt dependencies
sudo apt-get install mesa-common-dev --yes &&
sudo apt-get install libglu1-mesa-dev --yes &&

#Install Qt && Google Chrome
if [[ $(getconf LONG_BIT) = "64" ]]
then
	echo "64bit Detected" &&
	echo "Installing Qt" &&
	wget http://download.qt-project.org/official_releases/qt/5.3/5.3.0/qt-opensource-linux-x64-5.3.0.run &&
	sudo chmod +x qt-opensource-linux-x64-5.3.0.run &&
	sudo ./qt-opensource-linux-x64-5.3.0.run &&

	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb &&
	rm -f google-chrome-stable_current_amd64.deb
else
	echo "32bit Detected" &&
	echo "Installing Qt" &&
	wget http://download.qt-project.org/official_releases/qt/5.3/5.3.0/qt-opensource-linux-x86-5.3.0.run &&
	sudo chmod +x qt-opensource-linux-x86-5.3.0.run &&
	sudo ./qt-opensource-linux-x86-5.3.0.run &&

	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
	sudo dpkg -i google-chrome-stable_current_i386.deb --yes &&
	rm -f google-chrome-stable_current_i386.deb
fi

#Install Git
sudo apt-get install git --yes &&

#Install build-essential package (mostly for GCC)
sudo apt-get install build-essential --yes &&

#Install VLC media player
sudo apt-get install vlc --yes &&

#Install 'foremost' and 'scalpel' forensic tools
sudo apt-get install foremost --yes &&
sudo apt-get install scalpel --yes &&

#Upgrade all packages
sudo apt-get upgrade --yes
