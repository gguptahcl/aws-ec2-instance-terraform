data "template_file" "ec2-init" {
  template = "${file("scripts/ec2-init.sh")}"

}
data "template_cloudinit_config" "cloudinit-ec2" {

  gzip = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.ec2-init.rendered}"
  }

}
