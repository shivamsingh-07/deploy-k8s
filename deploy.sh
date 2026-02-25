#! /bin/bash

set -e
trap 'echo "Error: script failed at line $LINENO" >&2; exit 1' ERR

echo "==> Bringing up Vagrant VMs..."
vagrant up

echo "==> Ensuring ~/.kube exists..."
mkdir -p ~/.kube

echo "==> Copying kubeconfig to ~/.kube/config..."
cp -i config.yaml ~/.kube/config

echo "==> Kubectl configuration completed successfully"
