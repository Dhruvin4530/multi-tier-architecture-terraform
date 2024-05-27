# data block to fetch Ubuntu 20.04 AMI ID
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_launch_template" "template-app" {
  name          = var.app_launch_template_name
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.app_instance_type
  key_name      = var.key-name

  network_interfaces {
    device_index    = 0
    security_groups = [var.app_sg_id]
  }

  tag_specifications {

    resource_type = "instance"
    tags = {
      Name = var.app_instance_name
    }
  }
}

resource "aws_launch_template" "template-web" {
  name          = var.web_launch_template_name
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.web_instance_type
  key_name      = var.key-name

  network_interfaces {
    device_index    = 0
    security_groups = [var.web_sg_id]
  }

  user_data = filebase64("/Users/dhruvinsoni/multi-tier-architecture-terraform/modules/auto-scaling/user-data.sh")
  tag_specifications {

    resource_type = "instance"
    tags = {
      Name = var.web_instance_name
    }
  }
}
