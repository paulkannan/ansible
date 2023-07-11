provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"

  provisioner "ansible" {
    playbook_file = "install_oracle.yml"
    extra_vars = {
      variable1 = "value1"
      variable2 = "value2"
    }
    inventory_static_groups = {
      "all" = [self.public_ip]
    }
  }
}
