# Terraform POC Instance Module -- main.tf

resource "aws_instance" "this" {
  count                   = var.instances

  ami                     = var.ami
  instance_type           = var.instance_type
  user_data               = var.user_data
  user_data_base64        = var.user_data_base64

  availability_zone       = var.availability_zone
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = var.vpc_security_group_ids

  provisioner "remote-exec" {
    inline    = ["echo booted"]

    connection {
      type      = "winrm"
       user     = var.remote_exec_user
       password = var.remote_exec_password
       host     = self.public_ip
       port     = 5985
       insecure = true
       https    = false
       timeout  = "10m"
    }
  }

  tags = merge(
    {"Name" = "${var.staticvmname}" != null ? "${var.staticvmname}" : format("${var.vmname}${var.vmnameformat}", count.index + 1)},
    var.tags
  )
}
