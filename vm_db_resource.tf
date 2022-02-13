resource "vsphere_virtual_machine" "db" {
  count            = 2
  name             = "${var.resource_name["db"]}-${1+count.index}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder           = "${var.folder}"

  num_cpus = 2
  memory   = 4096
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.resource_name["db"]}-${1+count.index}"
        domain    = "${var.domain}"
      }

      network_interface {
        
        ipv4_address = "${var.subnet}.${94+count.index}"
        ipv4_netmask = "${var.netmask}"
      }
      dns_server_list = var.dns_server_list
      ipv4_gateway = "${var.gateway}"
    }
  }

  provisioner "remote-exec"  {
    inline = [
        "mkdir /${var.vm_username}/.ssh",
        "chmod 700 /${var.vm_username}/.ssh",
        "touch /${var.vm_username}/.ssh/authorized_keys",
        "chmod 600 /${var.vm_username}/.ssh/authorized_keys",
        "echo ${var.ssh_pub_key} >> /${var.vm_username}/.ssh/authorized_keys",
    ]
    connection {
        type     = "ssh"
        user     = "${var.vm_username}"
        password = "${var.vm_password}"
        host    = "${var.subnet}.${94+count.index}"
    }
  }
}