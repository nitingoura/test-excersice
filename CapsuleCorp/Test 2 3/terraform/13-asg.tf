resource "aws_launch_configuration" "apps" {
  name            = "app-${local.naming_convention}-asg-lc"
  instance_type   = "t2.micro"
  image_id        = data.aws_ami.amazon_linux.id
  security_groups = [module.alb_http_sg.security_group_id, module.alb_sg.security_group_id]
  key_name        = "dummy.pem"
  user_data       = data.template_file.installnginx.rendered

  lifecycle {
    create_before_destroy = true
  }

}

# Create AutoScaling group
resource "aws_autoscaling_group" "as-apps" {
  name                      = "app-${local.naming_convention}-asg"
  launch_configuration      = aws_launch_configuration.apps.name
  min_size                  = 3
  max_size                  = 5
  desired_capacity          = 3
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.private_subnets
  target_group_arns         = module.alb.target_group_arns

  lifecycle {
    create_before_destroy = true
  }
}