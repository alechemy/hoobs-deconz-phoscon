#!/bin/bash

echo "----------------------------------------------------------------"
echo "This will install DeConz and Phoscon for HOOBS 3"
echo "----------------------------------------------------------------"

echo "----------------------------------------------------------------"
echo "After the installation is completed the Device performs an"
echo "reboot and you can access Phoscon and HOOBS as following:"
echo "----------------------------------------------------------------"
echo "Phoscon Interface is reachable at hoobs.local"
echo "HOOBS   Interface is reachable at hoobs.local:8080"
echo "----------------------------------------------------------------"
wait 10
echo "Enable Raspberry Serial Port.."
sudo raspi-config nonint do_serial 1
echo "Raspberry Serial Port enabled"
echo "----------------------------------------------------------------"
echo "Get Phoscon Public Key....."
wget -O - http://phoscon.de/apt/deconz.pub.key | \
sudo apt-key add -
echo "Installing....."
sudo sh -c "echo 'deb http://phoscon.de/apt/deconz \
            $(lsb_release -cs) main' > \
            /etc/apt/sources.list.d/deconz.list"
sudo apt update
sudo apt install deconz
echo "DeConz & Phoscon installed."
echo "----------------------------------------------------------------"
echo "Installing Wiring Pi (for Rpi4B)....."
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
echo "Wiring Pi (for Rpi4B) installed"
echo "----------------------------------------------------------------"
echo "Updating DeConz"
wget https://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb
sudo dpkg -i deconz-latest.deb
echo "DeConz updated"
echo "----------------------------------------------------------------"
echo "Disable GUI for DeConz...."
sudo systemctl disable deconz-gui.service
sudo systemctl disable nginx.service
echo "GUI for DeConz disabled"
echo "----------------------------------------------------------------"
echo "After the installation is completed the Device performs an"
echo "reboot and you can access Phoscon and HOOBS as following:"
echo "----------------------------------------------------------------"
echo "Phoscon Interface is reachable at hoobs.local"
echo "HOOBS   Interface is reachable at hoobs.local:8080"
echo "----------------------------------------------------------------"
echo "----------------------------------------------------------------"
echo "Rebooting now in 10 Seconds.........."
echo "----------------------------------------------------------------"
wait 10
sudo reboot

