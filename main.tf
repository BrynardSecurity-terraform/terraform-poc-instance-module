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


  provisioner "local-exec" {
    working_dir = var.working_dir
    command     = var.command
  }

  tags = merge(
    {"Name" = "${var.staticvmname}" != null ? "${var.staticvmname}" : format("${var.vmname}${var.vmnameformat}", count.index + 1)},
    var.tags
  )
}
