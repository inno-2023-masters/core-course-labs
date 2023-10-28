module "app_python" {
  source = "./docker"
  image = "rametago/my-first-repo:latest"
  container_name = "my_python_app"

}


module "app_typescript" {
  source = "./docker"
  image = "rametago/my-first-repo:svelte"
  container_name = "my_typescript_app"
  internal_port = 5137
  external_port = 5137
}
