resource "aws_lb_target_group" "test-target-gp" {
  name     = "test-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
   health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  

}

