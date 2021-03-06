#!/bin/bash

sudo apt update

sudo apt install ntp -y

# Install the AWS CLI
install_aws_cli(){
    sudo apt-get install python python-pip -y
    sudo pip install --upgrade pip
    sudo pip install awscli
}

install_aws_ssm_agent(){
    cd /tmp			
    wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
    sudo dpkg -i amazon-ssm-agent.deb
    sudo systemctl enable amazon-ssm-agent
}

install_rundeck(){
    sudo apt-get install openjdk-8-jdk -y
    cd /tmp 
    wget http://dl.bintray.com/rundeck/rundeck-deb/rundeck_2.10.7-1-GA_all.deb
    sudo dpkg -i rundeck_2.10.7-1-GA_all.deb
}

install_aws_cli
install_aws_ssm_agent
install_rundeck