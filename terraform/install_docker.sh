#!/bin/bash

#INSTALLING JENKINS
sudo apt update && sudo apt install default-jre
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings>
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update && sudo apt install jenkins -y

sudo systemctl start jenkins

#INSTALLING TERRAFORM
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform


#DOCKER COMPOSE STEPS
cd /home/ubuntu
git clone https://github.com/KuraLabsCohort3-TeamEQ/ifme.git
cd ifme/
sudo apt-get update 
sudo snap install docker 
sudo snap start docker 

sudo docker-compose build
sudo docker-compose run app rake db:create db:migrate 
sleep 3
sudo docker-compose run app rake db:seed
sudo docker-compose up

