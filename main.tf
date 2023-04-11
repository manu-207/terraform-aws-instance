# Instance 1
resource "aws_instance" "ec2A" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet1_id
  vpc_security_group_ids      = var.security_group1
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  tags = {
    "Name"                    = var.instance1_name
  }
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

# AMI 1

resource "aws_ebs_snapshot" "example1" {
  volume_id                   = aws_instance.ec2A.root_block_device[0].volume_id
}

resource "aws_ami" "example1" {
  name                        = var.web_ami_name
  description                 = var.web_ami_description
  architecture                = var.architecture
  virtualization_type         = var.virtualization_type
  root_device_name            = var.root_device_name

  ebs_block_device {
    device_name               = var.device_name
    snapshot_id               = aws_ebs_snapshot.example1.id
    volume_size               = aws_ebs_snapshot.example1.volume_size
    delete_on_termination     = var.delete_on_termination
  }
}

# Instance 2
resource "aws_instance" "ec2B" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet2_id
  vpc_security_group_ids      = var.security_group2
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  tags = {
    "Name"                    = var.instance2_name
  }
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

# AMI 2

resource "aws_ebs_snapshot" "example2" {
  volume_id                   = aws_instance.ec2B.root_block_device[0].volume_id
}

resource "aws_ami" "example2" {
  name                       = var.app_ami_name
  description                = var.app_ami_description
  architecture               = var.architecture
  virtualization_type        = var.virtualization_type
  root_device_name           = var.root_device_name

  ebs_block_device {
    device_name              = var.device_name
    snapshot_id              = aws_ebs_snapshot.example2.id
    volume_size              = aws_ebs_snapshot.example2.volume_size
    delete_on_termination    = var.delete_on_termination
  }
}
