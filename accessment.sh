#! bin/bash

# update and upgrade system
apt update
apt upgrade -y

# Check the system's architecture
if [ $(uname -m) = x86_64 ]; then
    echo "This system is running on AMD64 (x86_64) architecture."
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
elif [ $(uname -m) = aarch64 ]; then
    echo "This system is running on ARM64 (aarch64) architecture."
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
else
    echo "Unsupported architecture: $(uname -m)"
    exit 1
fi

# enable execution and move to PATH
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# create a cluster
kind create cluster --name express-demo

kubectl config use-context kind-express-demo

kubectl config view --minify --flatten > express-demo-config.yaml

# set the KUBECONFIG environment variable 
export KUBECONFIG=./express-demo-config.yaml

terraform init
terraform apply
