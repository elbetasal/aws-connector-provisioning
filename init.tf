// variable "key_name" {}

provider "aws" {
  access_key = "AKIAZNSHZAOX267AXRU3"
  secret_key = "+lk0txXGrk+rkt+2YF/CKIPeR2V1UmOoLoN3BrDO"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-024a64a6685d05041"
  instance_type = "t2.micro"
  // key_name = "${var.key_name}"
  key_name = "pleymo-laptop"
  user_data = "${file("init.conf")}"
}
output "ip" {
value = "${aws_instance.example.public_ip}"
}