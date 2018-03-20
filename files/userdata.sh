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

install_aws_cli
install_aws_ssm_agent