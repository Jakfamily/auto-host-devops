# modules/vm-pfsense/outputs.tf

output "vm_id" {
  description = "ID de la VM pfSense"
  value       = proxmox_vm_qemu.pfsense.id
}

output "vm_name" {
  description = "Nom de la VM pfSense"
  value       = proxmox_vm_qemu.pfsense.name
}

# Informations réseau
output "wan_interface" {
  description = "Configuration de l'interface WAN (net0)"
  value       = proxmox_vm_qemu.pfsense.net0
}

output "lan_interface" {
  description = "Configuration de l'interface LAN (net1)"
  value       = proxmox_vm_qemu.pfsense.net1
}

output "dmz_interface" {
  description = "Configuration de l'interface DMZ (net2)"
  value       = proxmox_vm_qemu.pfsense.net2
}

# Note: Les IPs ne seront disponibles qu'après configuration de pfSense
output "wan_ip" {
  description = "Adresse IP de l'interface WAN de pfSense (si disponible)"
  value       = try(proxmox_vm_qemu.pfsense.default_ipv4_address, "Non configurée")
}

output "target_node" {
  description = "Nœud Proxmox hébergeant la VM pfSense"
  value       = proxmox_vm_qemu.pfsense.target_node
}

output "vm_status" {
  description = "Statut actuel de la VM pfSense"
  value       = proxmox_vm_qemu.pfsense.status
}

output "memory" {
  description = "Mémoire allouée à la VM pfSense"
  value       = proxmox_vm_qemu.pfsense.memory
}

output "tags" {
  description = "Tags associés à la VM pfSense"
  value       = proxmox_vm_qemu.pfsense.tags
}
