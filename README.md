# proxmox-homelab-kube

Terraform to create a 3 node group for running k8s in proxmox.

## Steps:

#### Create a VM template
- SSH into proxmox node
- Run  `wget -O template.sh https://raw.githubusercontent.com/ash0ne/proxmox-homelab-kube/main/prepare-vm-template.sh && . template.sh`

#### Create an API key

