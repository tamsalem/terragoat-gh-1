# Create a new load balancer
resource "aws_elb" "weblb" {
  name = "weblb-terraform-elb"

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  subnets                     = [aws_subnet.web_subnet.id]
  security_groups             = [aws_security_group.web-node.id]
  instances                   = [aws_instance.web_host.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = merge({
    Name = "foobar-terraform-elb"
    }, {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform47/aws/elb.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "b4a83ce9-9a45-43b4-b6d9-1783c282f702"
  })
}