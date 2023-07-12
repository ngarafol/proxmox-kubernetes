# Fetch a cloud-init image of Ubuntu
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

# If you have multiple nodes and run a proxmox cluster, try and run this on the node with the maximum storage
# If you are not on a proxmox subscription, disable any enterprise repos( https://enterprise.proxmox.com/**) before running this script
# The enterprise repos can be disabled by clicking on the node name (For e.g. 'pve') and going into the 'Repositories' sections
apt update -y
apt install libguestfs-tools -y
virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent

# Create a base VM with the right config for you
# Lable it with ID 999 so that the template doesn't show up on the top of your list
qm create 999 --name "ubuntu-2204-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 999 focal-server-cloudimg-amd64.img local-lvm
qm set 999 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-999-disk-0
qm set 999 --boot c --bootdisk scsi0
qm set 999 --ide2 local-lvm:cloudinit
qm set 999 --serial0 socket --vga serial0
qm set 999 --agent enabled=1

# Make it a template
qm template 999

