
# replace with your proxmox server url
server_url         = "http://<proxmox-server-url>/api2/json"

# Add the token details of the token. See README for generation instructions 
token_id           = "<token-id>"
token_secret       = "<token-secret>"

# The initial ssh key that you would want to add to login to the kube nodes as user 'ubuntu'
ssh_key            = "<ssh-key>"

# Default gateway
gateway            = "192.168.0.1"

# Variables for creating the VM which becomes the main k8s node
# Proxmox node where you want the VM for your k8s main node to go (For e.g. 'pve' or 'pve-01')
target_node_main = "<node-name>"

# Details of the static IP that you'd want for the main VM
ip_net_main             = "192.168.0.100/24"