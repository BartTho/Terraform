# ---- Proxmox API ----
pm_api_url          = "https://192.168.3.200:8006/api2/json"
pm_api_token_id     = "terraform@pve!terraform-token"
pm_api_token_secret = "5ab656e7-b6fb-408f-9c78-cab45e3b94f4"
target_node         = "proxmox"
pm_tls_insecure     = true
storage             = "local-lvm"
vm_bridge           = "vmbr0"

# ---- VM Configurations (optionnel si tu veux override) ----
vm_configs = {
  debian = {
    template_name = "Master-Debian13"
    count         = 1
    name_prefix   = "debian"
    memory        = 512
    cores         = 1
    disk_size     = "10G"
  },
  win11 = {
    template_name = "Master-WinServer"
    count         = 0
    name_prefix   = "win11"
    memory        = 1024
    cores         = 1
    disk_size     = "50G"
  }
}
