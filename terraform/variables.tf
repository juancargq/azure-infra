variable "resource_group_name" {
  description = "El nombre del grupo de recursos"
  default     = "RG-CP2"
}

variable "location" {
  description = "La localización donde se van a alojar los recursos"
  default     = "West Europe"
}

variable "availability_set_name" {
  description = "El nombre del conjunto de disponibilidad"
  default     = "AS-CP2"
}

variable "virtual_machine_name" {
  description = "El nombre de la máquina virtual Linux"
  default     = "Linux-VM-CP2"
}

variable "virtual_network_name" {
  description = "El nombre de la red virtual"
  default     = "VN-CP2"
}

variable "subnet_name" {
  description = "El nombre de la subnet"
  default     = "VN-CP2-subnet"
}

variable "network_interface_name" {
  description = "El nombre de la interfaz de red"
  default     = "NI-CP2"
}

variable "public_ip_name" {
  description = "El nombre de la IP publica de la maquina virtual"
  default     = "public-ip"
}

variable "security_group_name" {
  description = "El nombre del grupo de seguridad de la red"
  default     = "SG-CP2"
}