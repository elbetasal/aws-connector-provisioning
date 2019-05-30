variable "key_name" {}

provider "aws" {
  access_key = "AKIAZNSHZAOX267AXRU3"
  secret_key = "+lk0txXGrk+rkt+2YF/CKIPeR2V1UmOoLoN3BrDO"
  region     = "us-east-1"
}

resource "tls_private_key" "example" {
    algorithm ="RSA"
    rsa_bits= 4096
}

resource "aws_key_pair" "generated_key" {
    key_name ="${var.key_name}"
    public_key ="${tls_private_key.example.public_key_openssh}"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.generated_key.key_name}"
}
output "ip" {
value = "${aws_instance.example.public_ip}"
}

output "key" {
    value ="${aws_key_pair.generated_key.public_key}"
}
