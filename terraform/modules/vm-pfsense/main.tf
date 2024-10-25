#modules/vm-pfsense/main.tf
terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "pfsense" {
  name         = var.vm_name
  target_node  = var.proxmox_node
  cdrom        = var.cdrom
  cores        = var.cores
  sockets      = var.sockets
  memory       = var.memory
  onboot       = var.onboot
  agent        = 1
  qmagent      = 1
  hotplug      = "network,disk,usb"

  # Interfaces réseau pour pfSense
  net0 = "model=virtio,bridge=${var.network_interface_wan}"
  net1 = "model=virtio,bridge=${var.network_interface_lan}"
  net2 = "model=virtio,bridge=${var.network_interface_dmz}"

  # Configuration du disque
  disk {
    size     = var.disk_size
    storage  = var.disk_storage
    type     = "scsi"
    format   = "qcow2"
  }

  # Tags spécifiques à la VM pfSense
  tags = var.tags
}
