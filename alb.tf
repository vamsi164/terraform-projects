resource "aws_lb" "external_alb" {
name = "external-lb-new"
internal = false
load_balancer_type = "application"
security_groups = [aws_security_group.demosg.id]
subnets=[aws_subnet.public_subnet-1.id, aws_subnet.public_subnet-2.id]
}
resource "aws_lb_target_group" "target_elb" {
name = "alb-tg"
port = 80
protocol = "HTTP"
vpc_id = aws_vpc.demovpc.id
}
resource "aws_instance" "demoinstance" {
  ami               = "ami-0166fe664262f664c"
  instance_type     = "t2.micro"
  count             = 2
  key_name          = "new-key-pair-ec2"
  vpc_security_group_ids = [aws_security_group.demosg.id]
  subnet_id         = aws_subnet.public_subnet-1.id
  associate_public_ip_address = true
  tags = {
    Name = "My public Instance"
}
}
resource "aws_lb_target_group_attachment" "attachment" {
count =2
target_group_arn = aws_lb_target_group.target_elb.arn
target_id = aws_instance.demoinstance[0].id
port= 80
depends_on = [aws_instance.demoinstance]
}
resource "aws_lb_listener" "external_elb" {
load_balancer_arn = aws_lb.external_alb.arn
port= 80
protocol = "HTTP"
default_action {
type = "forward"
target_group_arn = aws_lb_target_group.target_elb.arn
}
}
