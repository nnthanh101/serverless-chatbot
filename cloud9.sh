#!/bin/bash

# echo "[+] AMZ-Linux2/CenOS EBS Extending a Partition on a T2/T3 Instance"
# sudo growpart /dev/nvme0n1 1
# lsblk
# echo "Extend an ext2/ext3/ext4 file system"
# sudo resize2fs /dev/nvme0n1p1
# sudo resize2fs /dev/nvme1n1
# df -hT

echo "Installing Utilities: jq ..."
sudo yum -y update
sudo yum -y upgrade
sudo yum install -y jq wget unzip bash-completion gettext moreutils

echo "Upgrade lts/fermium nodejs12.x & Installing CDK ..."
# nvm install lts/erbium
# nvm install lts/fermium
# nvm use lts/erbium
# nvm alias default lts/erbium
# nvm uninstall v10.24.0

npm update -g
npm install -g aws-cdk@1.84.0

sudo pip3 install boto3
echo "Uninstall the AWS CLI version 1 using pip"
sudo pip uninstall awscli
echo "Install the AWS CLI version 2 using pip"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
# sudo ./aws/install
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

# echo "Installing kubectl & eksctl & helm-3 ..."
# sudo curl --silent --location -o /usr/local/bin/kubectl \
#          https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
# sudo chmod +x /usr/local/bin/kubectl

# curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# sudo mv -v /tmp/eksctl /usr/local/bin

# curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# echo "Installing K9s"
# K9S_VERSION=0.24.2
# K9S_TAR_FILENAME=k9s_$(uname -s)_$(uname -m).tar.gz
# curl -o /tmp/$K9S_TAR_FILENAME -L -k https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/$K9S_TAR_FILENAME
# tar -xvf /tmp/$K9S_TAR_FILENAME -C /tmp/
# sudo mv /tmp/k9s /usr/local/bin/k9s
# sudo chmod +x /usr/local/bin/k9s 

echo "[x] Verify AWS CLI": $(aws  --version)
echo "[x] Verify git":     $(git  --version)
echo "[x] Verify jq":      $(jq   --version)
echo "[x] Verify nano":    $(nano --version)
echo "[x] Verify Docker":  $(docker version)
# echo "[x] Verify nvm":     $(nvm ls)
echo "[x] Verify Node.js": $(node --version)
echo "[x] Verify CDK":     $(cdk  --version)
# echo "[x] Verify Python":  $(python -V)
# echo "[x] Verify Python3": $(python3 -V)

# echo "[x] Verify kubectl": $(kubectl version --client)
# echo "[x] Verify eksctl":  $(eksctl version)
# echo "[x] Verify helm":    $(helm version --short)
# echo "[x] Verify k9s":     $(k9s version --short)
