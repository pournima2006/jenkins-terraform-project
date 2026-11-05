terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "app_image" {
  name         = "jenkins-demo:1.0"
  keep_locally = true
}

resource "docker_container" "app_container" {
  name  = "terraform-demo"
  image = docker_image.app_image.image_id

  ports {
    internal = 80
    external = 8082
  }
}
