__Provisioning vSphere infrastructure with Terraform and Ansible__
================================

Infrastructure as Code on vSphere environment with Terraform and Ansible


__Basic settings__
------------
* Creating virtual machines from template Terraform
* Installing packages based on Ansible playbooks, setting up httpd and postgresql
* Using null_resource on Terraform to execute Ansible plabooks
* Configuring resources on Terraform in separate files for Web and Database virtual machines

__Requirements__
------------
* Terraform v1.1.4
* Ansible 2.11.7
* vSphere 6.5

Dependencies
------------
* Copy Terraform control machine user's public SSH key (usually called id_rsa.pub) into ./terraform.tfvars.
* Requires elevated root privileges
* Add hosts address and names for VMs : ./ansible/inventory and ./terraform.tfvars
* Prepare variable file based on your requirements: ./terraform.tfvars and ./ansible/vars/...

__Note__
------------
* Based on Terraform files and Ansible playbooks, you can create new VMs(including all settings) in vSphere within a few minutes and delete it in seconds.

Running the Deployment
----------------------

__To deploy__

`$ terraform apply`

Destroy the Deployment
----------------------

__To destroy__

`$ terraform destroy`

__Author Information__
------------------

Samir Nabadov
