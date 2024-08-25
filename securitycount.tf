locals {
        inbound_ports = [80, 443, 8080, 91]
        outbound_ports = [443, 1433, 8080, 91]
}

resource "aws_security_group" "created-by-terraform" {
    name         = "ec2-sg-new"
    name        = "ec2-sg-new.${count.index}"
    count       = "3"
    description = "Allow inbound traffic on port 22"
    #vpc_id      = data.aws_vpc.default.id
    
    ingress {
        description = "SSH from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

}
