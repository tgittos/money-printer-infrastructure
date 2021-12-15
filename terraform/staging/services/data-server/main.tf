module "api_cluster" {
  source = "../../../modules/small-cluster"

  cluster_prefix = "ds_staging"
  task_definition_filename = "${path.module}/../../task-definitions/data-server.json.tpl"
  ecr_repo_url = var.ecr_repo_url
  image_id = "00f7e5c52c0f43726"
  instance_type = "t2.micro"
  iam_instance_profile_name = var.iam_instance_profile_name
  security_group_id = var.security_group_id
  subnet_id = var.subnet_id
}
