output "public_subnet_1_id" {
  value = aws_subnet.mp_public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.mp_public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.mp_private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.mp_private_subnet_2.id
}

output "ecs_security_group_id" {
  value = aws_security_group.mp_app_ecs_sg.id
}

output "ecs_security_group_name" {
  value = aws_security_group.mp_app_ecs_sg.name
}

output "db_security_group_id" {
  value = aws_security_group.mp_app_rds_sg.id
}