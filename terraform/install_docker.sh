#!/bin/bash

sudo apt update && sudo apt install default-jre
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings>
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update && sudo apt install jenkins -y

sudo systemctl start jenkins
sudo systemctl status jenkins

sudo passwd jenkins
sudo su - jenkins -s /bin/bash


cd /home/ubuntu
git clone https://github.com/KuraLabsCohort3-TeamEQ/ifme.git
cd ifme/
sudo apt-get update 
sudo snap install docker 
sudo snap start docker 


