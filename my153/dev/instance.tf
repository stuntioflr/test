provider "aws" {
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "${var.region}"
}


resource "aws_instance" "${var.env_name}" {
  ami           = "${var.ami_id}"
  instance_type = "${var.type}"
  count		= "${var.count}"
  key_name	= "${var.key_name}"
  security_groups = "${var.security_groups}"
  cpu_core_count = "${var.cpu_core[count.index]}"
  tags = {
    Name = "${var.user_names[count.index]}"
  }
root_block_device {
      volume_type = "standard"
      volume_size = "${var.vol_size}"
      delete_on_termination = true
    }
}
