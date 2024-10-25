#main.tf

module "pfsense" {
  source                 = "./modules/vm-pfsense"
  proxmox_node           = var.proxmox_node
  vm_name                = var.pfsense_vm_name
  cdrom                  = var.pfsense_cdrom
  cores                  = var.pfsense_cores
  sockets                = var.pfsense_sockets
  memory                 = var.pfsense_memory
  network_interface_wan  = var.network_interface_wan
  network_interface_lan  = var.network_interface_lan
  network_interface_dmz  = var.network_interface_dmz
  disk_size              = var.pfsense_disk_size
  disk_storage           = var.disk_storage
  onboot                 = var.onboot
  tags                   = var.pfsense_tags
}

module "vm_traefik" {
  source = "./modules/vm-traefik"
}

module "vm_docker_host" {
  source = "./modules/vm-docker-host"
}

module "lxc_db" {
  source = "./modules/lxc-db"
}

module "lxc_monitoring" {
  source = "./modules/lxc-monitoring"
}
