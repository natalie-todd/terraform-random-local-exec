resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 12

  provisioner "local-exec" {
      command = "aws --version"
  }
}

output "random" {
  value = random_id.random.hex
}

resource "null_resource" "exec-script" {
  provisioner "local-exec" {
    command = "aws --version"
  }
}