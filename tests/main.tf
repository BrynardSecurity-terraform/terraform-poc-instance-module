provider "aws" {}

module "poc_test" {
  source            = "../"
  instances         = 1
  instance_type     = "t2.medium"
  ami               = "ami-0fc5c1bba44e4f6e8"
  vmname            = "test"
  vmnameformat      = "%02dtesting"
  availability_zone = "us-west-2a"
  subnet_id         = "subnet-6deda414"
}
