#!/bin/bash

# install docker
apt-get update
apt-get install -y unzip docker.io
apt-get install git-core
apt-get install -y build-essential
# sudo apt-get install build-essential

# enable docker and add perms
usermod -G docker
systemctl enable docker
service docker start

# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py
rm -f get-pip.py
# install awscli
pip install awscli

# install terraform
wget -q https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip \
&& unzip -o terraform_0.11.8_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_0.11.8_linux_amd64.zip

# install install-aws-iam-authenticator

apt-get update
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator


# install kubernetes-client

sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# install install-aws-iam-authenticator

apt-get update
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# clean up
apt-get clean
rm terraform_0.11.8_linux_amd64.zip
