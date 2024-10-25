#variables.tf

# Variables globales pour Proxmox
variable "proxmox_url" {
  description = "URL API de Proxmox"
  type        = string
}

variable "proxmox_user" {
  description = "Nom d'utilisateur pour l'API Proxmox"
  type        = string
}

variable "proxmox_password" {
  description = "Mot de passe ou token secret pour l'API Proxmox"
  type        = string
  sensitive   = true
}

variable "proxmox_tls_insecure" {
  description = "Permet les connexions non sécurisées"
  type        = bool
  default     = false
}


# Variables pour la VM pfSense
variable "pfsense_vm_name" {
  description = "Nom de la VM pfSense"
  type        = string
  default     = "pfSense-VM"
}

variable "pfsense_cdrom" {
  description = "Chemin vers l'ISO pour pfSense"
  type        = string
  default     = "local:iso/pfsense.iso"
}

variable "pfsense_cores" {
  description = "Nombre de cœurs pour pfSense"
  type        = number
  default     = 2
}

variable "pfsense_sockets" {
  description = "Nombre de sockets pour pfSense"
  type        = number
  default     = 1
}

variable "pfsense_memory" {
  description = "Mémoire en Mo pour pfSense"
  type        = number
  default     = 1024
}

variable "pfsense_disk_size" {
  description = "Taille du disque pour pfSense"
  type        = string
  default     = "32G"
}

variable "pfsense_tags" {
  description = "Tags pour identifier la VM pfSense"
  type        = map(string)
  default     = {
    "role" = "firewall"
  }
}


# Variables réseau et globales pour les VMs
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

variable "proxmox_node" {
  description = "Nom du nœud Proxmox où déployer les VM"
  type        = string
}

variable "disk_storage" {
  description = "Storage Proxmox pour les disques des VMs"
  type        = string
  default     = "local-lvm"
}

variable "onboot" {
  description = "Démarrer la VM au boot du serveur"
  type        = bool
  default     = true
}
