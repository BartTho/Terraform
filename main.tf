# =====================================
# Ressources pour les VM Proxmox
# =====================================

# ---- Debian ----
resource "proxmox_vm_qemu" "debian" {
  count       = var.vm_configs["debian"].count
  name        = "${var.vm_configs["debian"].name_prefix}-${count.index + 1}"
  target_node = var.target_node
  clone       = var.vm_configs["debian"].template_name
  vmid        = 400 + count.index

  cpu {
    cores = var.vm_configs["debian"].cores
  }

  memory = var.vm_configs["debian"].memory

  disk {
    slot    = "scsi0"
    type    = "disk"
    size    = var.vm_configs["debian"].disk_size
    storage = var.storage
  }
  
  ipconfig0 = "static 192.168.3.${20 + count.index}/24"
  network {
    id     = 0
    model  = "virtio"
    bridge = var.vm_bridge
  }
}
