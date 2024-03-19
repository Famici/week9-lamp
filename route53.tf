
resource "aws_route53_record" "rc1" {
  zone_id = "Z0290173HTUWRFL7T2WW"
  type = "A"
  ttl = 300
  name = "resume.famici.xyz"
  records = [ aws_lightsail_instance.server1.public_ip_address ]
}
