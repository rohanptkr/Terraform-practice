variable "names" {
  type    = set(string)
  default = ["rohan", "shivam", "ram", "pooja"]
}

resource "aws_security_group" "created-by-terraform" {
  for_each = var.names
  name     = "${each.value}-sg"
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]  
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
