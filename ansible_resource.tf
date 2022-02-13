resource "null_resource" "ansible" {

  triggers = {
      timestamp = timestamp()
  }

  provisioner "local-exec" {
      environment = {
        ANSIBLE_CONFIG = "${path.module}/ansible.cfg"
      }
      
      working_dir = "./ansible"
      command = "ansible-playbook -u ${var.vm_username} -i inventory deploy.yml"
  }
}


