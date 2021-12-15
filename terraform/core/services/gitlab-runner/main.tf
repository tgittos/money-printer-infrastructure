
data "template_file" "runner_task_definition" {
  template = file("${path.module}/build-server.json.tpl")
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.tpl")
  vars = {
    gitlab_access_token = var.gitlab_access_token
  }
}

resource "aws_launch_configuration" "mp_runner_ecs_launch_config" {
  image_id             = "ami-00f7e5c52c0f43726"
  iam_instance_profile = var.iam_instance_profile_name
  security_groups      = [var.security_group_id]
  user_data            = data.template_file.user_data.rendered
  instance_type        = "t2.micro"
}

resource "aws_autoscaling_group" "mp_app_ecs_asg" {
  name                      = "mp-app-asg"
  vpc_zone_identifier       = [var.subnet_id]
  launch_configuration      = aws_launch_configuration.mp_runner_ecs_launch_config.name

  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
}

resource "aws_ecs_cluster" "mp_runner_ecs_cluster" {
  name  = "mp-runner-ecs-cluster"
}

resource "aws_ecs_task_definition" "mp_runner_task_definition" {
  family                = "infrastructure"
  container_definitions = data.template_file.runner_task_definition.rendered
}

resource "aws_ecs_service" "mp_runner_ecs_service" {
  name            = "gitlab-runner"
  cluster         = aws_ecs_cluster.mp_runner_ecs_cluster.id
  task_definition = aws_ecs_task_definition.mp_runner_task_definition.arn
  desired_count   = 1
}
