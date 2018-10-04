provider "aws" { 
    region = "${var.AWS_REGION}"
}


resource "aws_instance" "ec2-instance" {

  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

   # the public SSH key
   key_name  = "${var.EC2_KEY_NAME}"	

  # the security group
  security_groups  = 	["${aws_security_group.ec2-securitygroup.name}"]
  
  availability_zone = "us-east-1a"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-ec2.rendered}"

 tags {
    Name = "terraform-eks-demo-ec2-instance"
  }

}

/*
resource "aws_ebs_volume" "ec2-data" {
    availability_zone = "us-east-1a"
    size = 20
    type = "gp2" 
    tags {
        Name = "ec2-data"
    }
}
*/
/*
resource "aws_volume_attachment" "ec2-data-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.ec2-data.id}"
  instance_id = "${aws_instance.ec2-instance.id}"
}
*/



# ec2 security group

resource "aws_security_group" "ec2-securitygroup" {
  #vpc_id = "${aws_vpc.main.id}"
  name = "terraform-eks-ec2-instance-securitygroup"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
tags {
    Name = "Terraform EKS EC2 instance Security Group"
  }
}

