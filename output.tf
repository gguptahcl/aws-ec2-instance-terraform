output "ec2-instance" {
  value = "${aws_instance.ec2-instance.public_ip}"
}

