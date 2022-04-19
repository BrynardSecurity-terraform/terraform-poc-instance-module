# Terraform POC Instance Module -- variables.tf

variable "ami" {
  description = "ID of the AMI to use for the instance"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "instances" {
  description = "Number of instances to be deployed from this module"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "remote_exec_user" {
  description = "Username of the remote exec user"
  type        = string
  default     = ""
}

variable "remote_exec_password" {
  description = "Password of the remote exec user"
  type        = string
  default     = ""
  sensitive   = true
}

variable "staticvmname" {
  description = "Static name of the EC2 instance. When this option is used, instances can't be scaled"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  type        = string
  default     = null
}

variable "vmname" {
  description = "The name of the virtual machine used to deploy the vms. This name can scale out based on number of instances and vmnameformat - example can be found under example folder"
  type        = string
  default     = null
}

variable "vmnameformat" {
  description = "vmname format. default is set to 2 decimal with leading 0. example: %03d for 3 decimal with leading zero or %02dprod for additional suffix"
  default     = "%02d"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}
