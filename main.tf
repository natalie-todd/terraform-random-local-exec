resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 12
}

output "random" {
  value = random_id.random.hex
}

resource "null_resource" "exec-script" {
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/sh

    python3 -m venv myenv
    python3 ./test.py
    EOT
  }
}