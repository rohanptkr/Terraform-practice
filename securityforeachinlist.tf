locals {
        inbound_ports = [80, 443, 8080, 91]
        outbound_ports = [443, 1433, 8080, 91]
}

resource "aws_security_group" "created-by-terraform" {
    name         = "ec2-sg-new"
    description = "Allow inbound traffic on port 22"
    #vpc_id      = data.aws_vpc.default.id
    
    dynamic "ingress" {
        for_each = local.inbound_ports
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
    }
    dynamic "egress" {
        for_each = local.outbound_ports
        content {
            from_port   = egress.value
            to_port     = egress.value
            protocol    = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ] 
    }
  }
}
