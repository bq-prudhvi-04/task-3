resource "aws_autoscaling_group" "webserver_AG" {
  #availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1
  vpc_zone_identifier = var.private_subnet

  launch_template {
    id      = aws_launch_template.LT_webserver.id

  }
}

resource "aws_autoscaling_policy" "webserver" {

  name                   = "webserver"
  autoscaling_group_name = aws_autoscaling_group.webserver_AG.name
  policy_type             = "TargetTrackingScaling"

   target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}