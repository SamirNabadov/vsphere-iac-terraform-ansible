variable "vsphere_user" {
    type = string
}

variable "vsphere_password" {
    type = string
}

variable "vsphere_server" {
    type = string
}

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_compute_cluster" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_network" {
  type = string
}

variable "vsphere_vm_template" {
  type = string
}

variable "folder" {
  type = string
}

variable "resource_name" {
  type = map
}

variable "dns_server_list" {
    type = list
}

variable "gateway" {
  type = string
}

variable "subnet" {
  type = string
}

variable "domain" {
  type = string
}

variable "netmask" {
  type = number
}

variable "vm_username" {
  type = string
}

variable "vm_password" {
  type = string
}

variable "ssh_pub_key" {
  type = string
}
