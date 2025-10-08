# Kubernetes Cluster with Vagrant & Ansible

This project sets up a minimal **Kubernetes (K8s) cluster** with **1 master** and **2 worker nodes** using **Vagrant** and **Ansible**. It's ideal for local development, testing, or learning purposes.

---

## 📁 Project Structure

```bash
.
├── .gitignore              # Git ignore file
├── config.yaml             # Configuration file (cluster or VM settings)
├── deploy.sh               # Script to provision VMs and run Ansible
├── inventory.ini           # Ansible inventory file
├── join-command            # Generated file containing 'kubeadm join' command
├── setup-playbook.yaml     # Ansible playbook for setting up Kubernetes
└── Vagrantfile             # Vagrant configuration for virtual machines
```

---

## 🚀 Features

-   Automated creation of two virtual machines via Vagrant
-   Kubernetes cluster setup using kubeadm (1 master, 1 worker)
-   Ansible playbook for consistent configuration
-   Easily reproducible with a single command

---

## 📦 Requirements

Ensure the following are installed:

-   Vagrant
-   VirtualBox
-   Ansible
-   bash

---

## ⚙️ Usage

1. Clone the repository
2. Run the deployment script
    - ```chmod +x deploy.sh```
    - ```./deploy.sh```

This will:

-   Launch 3 VMs (1 master, 2 worker) using Vagrant
-   Use Ansible to install Docker, kubeadm, kubelet, and Kubernetes components
-   Initialize the master node
-   Automatically join the worker to the cluster

---

## 📋 Ansible Inventory

The inventory.ini defines the master and worker nodes for Ansible

---

## 📜 Ansible Playbook

The setup-playbook.yaml handles:

-   Installing dependencies
-   Initializing Kubernetes (kubeadm)
-   Joining nodes to the cluster
-   Setting up kubeconfig

---

## 🧪 Verify the Cluster

SSH into the master node:

```bash
vagrant ssh master
```

Then run:

```bash
kubectl get nodes
```

You should see both the master and worker nodes in a Ready state.

---

## 🧼 Cleanup

To destroy the environment:

```bash
vagrant destroy -f
```
