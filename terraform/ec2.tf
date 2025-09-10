resource "aws_instance" "test_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "anubhavnv"

  user_data     = templatefile("${path.module}/user_setup.sh", { runner_token = var.runner_token })

  tags = {
    Name = "Anubhav-instance"
  }
}
