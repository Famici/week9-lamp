####################################################################################
# Keypair                                                                          #
####################################################################################

## Generate a secure private key and encodes it as .PEM
resource "tls_private_key" "lightsail_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Key Pair called "lamp"
resource "aws_lightsail_key_pair" "lightsail_key" {
  name       = "lamp"
  public_key = tls_private_key.lightsail_key.public_key_openssh
}

# Only To Save Keypair On Our Local Machine
resource "local_file" "ssh_key" {
  filename = "lamp.pem"
  content  = tls_private_key.lightsail_key.private_key_pem
}
