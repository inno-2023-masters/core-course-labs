module "app_python" {
  source         = "./docker"
  image          = "nikolina2k/ma-repo:latest"
  container_name = "my_python_app"
}

module "app_typescript" {
  source         = "./docker"
  image          = "nikolina2k/cat-pics:latest"
  container_name = "my_typescript_app"
  internal_port  = 5137
  external_port  = 5137
}
