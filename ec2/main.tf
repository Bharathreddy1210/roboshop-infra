data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.component
  }
}

provisioner "remote-exec" {
    connection {
    host     = self_public_ip
    user     = "centos"
    password = "DevOps321"
   }
    inline = [
      "git clone https://github.com/Bharathreddy1210/Shell-Scripting.git",
      "cd roboshop",
      "cd component",
      "sudo bash $(var.component).sh"
    ]


  }

resource "aws_security_group" "sg" {
  name        = "${var.component}.${var.env}.sg"
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "ALL"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}.${var.env}-sg"
  }
}

variable "component" {}
variable "instance_type" {}
variable "env" {}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}