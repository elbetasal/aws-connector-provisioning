variable "key_name" {}

provider "aws" {
  access_key = "{}"
  secret_key = "{}"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-024a64a6685d05041"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  user_data = "${file("init.conf")}"
  provisioner "file" {
      source      = "jsd-awsc-addon.tar.gz"
      destination = "/app/jsd-awsc-addon.tar.gz"
  }
}

output "ip" {
value = "${aws_instance.example.public_ip}"
}