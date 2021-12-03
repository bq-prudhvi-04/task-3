resource "aws_launch_template" "LT_webserver" {
  name_prefix   = "webserver"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.security_groups]
  user_data = filebase64("./nginx.sh")
        

}