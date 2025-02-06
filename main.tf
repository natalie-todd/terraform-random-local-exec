resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 13

  provisioner "local-exec" {
      command = "aws --version"
  }
}

output "random" {
  value = random_id.random.hex
}
