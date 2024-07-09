#!/bin/bash

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --vmid) VMID="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z $VMID ]]; then
    echo "VMID is required. Please provide a valid VMID using the --vmid option."
    exit 1
fi


# Fetch a cloud-init image of Ubuntu
wget -c https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

# If you have multiple nodes and run a proxmox cluster, try and run this on the node with the maximum storage
# If you are not on a proxmox subscription, disable any enterprise repos( https://enterprise.proxmox.com/**) before running this script
# The enterprise repos can be disabled by clicking on the node name (For e.g. 'pve') and going into the 'Repositories' sections
apt update -y
apt install libguestfs-tools -y
virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent

# Create a base VM with the right config for you
# Lable it with a unique and high ID so that the template doesn't show up on the top of your list
qm create $VMID --name "ubuntu-2204-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk $VMID focal-server-cloudimg-amd64.img iso-template
qm set $VMID --scsihw virtio-scsi-pci --scsi0 proxmox-shared:$VMID/vm-$VMID-disk-0.raw
qm set $VMID --boot c --bootdisk scsi0
qm set $VMID --ide2 proxmox-shared:cloudinit
qm set $VMID --serial0 socket --vga serial0
qm set $VMID --agent enabled=1

# Make it a template
qm template $VMID

