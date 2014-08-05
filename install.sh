#!/bin/bash

#This script is to help download & install useful software personally.

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe multiverse" &&

sudo apt-get update &&

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
	sudo dpkg -i google-chrome-stable_current_i386.deb &&
	rm -f google-chrome-stable_current_i386.deb
fi

sudo apt-get install build-essential &&
sudo apt-get install vlc &&
sudo apt-get install foremost &&

sudo apt-get upgrade
