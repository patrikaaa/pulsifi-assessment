#!/bin/bash
# Update the package repository
yum update -y

# Install git
yum install -y git

# Install and start Docker
yum install -y docker
systemctl enable docker
systemctl start docker

#just add what u need to be done at startup