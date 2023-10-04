#!/bin/bash

if ! [ -x "$(command -v docker)" ]; then
  echo "Docker not found. Installing Docker..."
  curl -fsSL https://get.docker.com/ | sh
  echo "Docker installed successfully."
else
  echo "Docker is already installed."
fi

echo "Installing Kind..."
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
chmod +x ./kind
mv kind /usr/local/bin
echo "Kind installed successfully."

echo "Installing kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin
echo "kubectl installed successfully."

echo 'alias k="kubectl"' >> ~/.bashrc
echo 'alias kaf="kubectl apply -f"' >> ~/.bashrc
echo "Aliases configured."

echo "All installations completed successfully."

exec bash