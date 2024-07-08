
# replace with your proxmox server url
server_url = "https://192.168.0.53:8006/api2/json"

# Add the token details of the token. See README for generation instructions 
token_id     = "terraform@pve!terraform"
token_secret = "a7c36e60-1dea-4e99-9c84-28699c4eb5aa"

# The initial ssh key that you would want to add to login to the kube nodes as user 'ubuntu'
ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1aWuqmZZ1NZ9lhkKxsvheNoSJOeYoFtralVa0AQqrC9Nw4ulGinltACZlE39rXrEDWz1K9ZtGYtPCQEUcpc1XgiDLVRhlR/PDo8wjzL7j1JWG4AZmFU07g+m2lgSp9R3muNPjYCNrUQGZy+HXADnTSolZ9SjFE3wvCFp+imqF9Vk07+WFupps30KO1kF/ZLviedTs9gWTUnArHYMl7QN+pcVeHMd5ZTrbF2egU0+1VcmClfkYUjXGu+YrWQIPhva02ehLeExiti5RHxyvx3wy8jbaVctZSf0Y93/1tk7t4cS23fIMI/wSwM0Z2AWT4lImSUftXexlW/+jmTxuAElX"

# Default gateway
gateway = "192.168.0.1"

# Storage is local
storage_name = "local"

# Variables for configuring the VM which becomes the main k8s node
# Proxmox node where you want the VM for your k8s main node to go (For e.g. 'pve' or 'pve-01')
target_node_main = "pve3"

# Details of the static IP that you'd want for the main VM
ip_net_main = "192.168.0.220/24"

# Variables for configuring the VMs that become the agent k8s nodes
# Proxmox node where you want the VM for your k8s agent nodes to go (For e.g. 'pve' or 'pve-02')
target_node_agent = "pve4"

# Details of the static IP that you'd want for the agent VMs
# IPs are created sequentially for all agent VMs. 
# For e.g. if agent VM resource count is 3 and you've defined the IP as 192.168.0.200, the IPs will be 192.168.0.200, 192.168.0.201 and 192.168.0.202
ip_net_agent = "192.168.0.221/24"
