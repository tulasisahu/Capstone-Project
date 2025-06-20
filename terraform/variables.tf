variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-0a0f1259dd1c90938" # Ubuntu 22.04 in ap-south-1
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of your AWS key pair"
  type        = string
}
