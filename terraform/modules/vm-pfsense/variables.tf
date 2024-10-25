#modules/vm-pfsense/variables.tf

variable "vm_name" {
  description = "Nom de la VM"
  type        = string
  default     = "pfsense"
}

variable "proxmox_node" {
  description = "Nœud Proxmox de déploiement pour pfSense"
  type        = string
}

variable "cdrom" {
  description = "Chemin vers l'ISO pour installer pfSense"
  type        = string
  default     = "local:iso/pfsense.iso"
}

variable "cores" {
  description = "Nombre de cœurs CPU pour pfSense"
  type        = number
  default     = 1
}

variable "sockets" {
  description = "Nombre de sockets pour pfSense"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Mémoire allouée en Mo pour pfSense"
  type        = number
  default     = 512
}

variable "onboot" {
  description = "Démarrer la VM au boot du serveur"
  type        = bool
  default     = true
}

variable "network_interface_wan" {
  description = "Nom du bridge pour l'interface WAN"
  type        = string
  default     = "vmbr0"
}

variable "network_interface_lan" {
  description = "Nom du bridge pour l'interface LAN"
  type        = string
  default     = "vmbr1"
}

variable "network_interface_dmz" {
  description = "Nom du bridge pour l'interface DMZ"
  type        = string
  default     = "vmbr2"
}

variable "disk_size" {
  description = "Taille du disque en GB pour pfSense"
  type        = string
  default     = "32G"
}

variable "disk_storage" {
  description = "Storage Proxmox pour le disque pfSense"
  type        = string
  default     = "local-lvm"
}

variable "tags" {
  description = "Tags pour identifier la VM pfSense"
  type        = map(string)
  default     = {
    "role" = "pfsense"
  }
}
