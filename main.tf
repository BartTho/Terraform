resource "docker_image" "python_image" {
  name = var.image
}

resource "docker_container" "python_container_1" {
  name  = var.container_name_1
  image = docker_image.python_image.latest

  volumes {
    container_path = "/app"
    host_path      = "${path.module}/app1"
  }

  ports {
    internal = 5000
    external = 5001
  }

  command = ["python", "/app/script.py"]
}

resource "docker_container" "python_container_2" {
  name  = var.container_name_2
  image = docker_image.python_image.latest

  volumes {
    container_path = "/app"
    host_path      = "${path.module}/app2"
  }

  ports {
    internal = 5000
    external = 5002
  }

  command = ["python", "/app/script.py"]
}

resource "local_file" "app1_script" {
  filename = "${path.module}/app1/script.py"
  content  = var.script_content
}

resource "local_file" "app2_script" {
  filename = "${path.module}/app2/script.py"
  content  = var.script_content
}
