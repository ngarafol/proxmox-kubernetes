# proxmox-homelab-kube

A complete package built using shell, Terrafrom and Ansible to create a fully running k8s cluster in a proxmox installation.
Most values default to the default installation settings of proxmox, the comments in the files should help you change any if you need to.

## Steps:

#### Create a VM template
- SSH into your proxmox node
- Run  `wget -O template.sh https://raw.githubusercontent.com/ash0ne/proxmox-homelab-kube/main/prepare-vm-template.sh && . template.sh`

#### Create an API key and add permissions
- Click on Datacenter -> Permissions -> API Tokens
- Click on 'Add' and create a token for one of your admin users. Ideally this must be an admin user in the pve realm but any admin user works just fine.
- Lastly, do not forget to add the permission for the API token by going to Permissions -> Add. This needs to be done even if the user ac=ssociated with the token already has permissions. 

#### Update values in terraform.tfvars
- Update everything to the right values in `terraform.tfvars`
- A sample tfvars file is added at `./terrafrom/terraform.tfvars`
