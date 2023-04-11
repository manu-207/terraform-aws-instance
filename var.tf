# ec2 instance

variable "ami_id" {
  description = "ami id"
}
variable "instance_type" {
  description = "instance_type"
}
variable "subnet1_id" {
  description = "subnet id"
}
variable "security_group1" {
  description = "security group ids"
}
variable "key_name" {
  description = "name of the key"
}
variable "instance1_name" {
  description = "name of the instance"
}
variable "subnet2_id" {
  description = "name of the key"
}
variable "security_group2" {
  description = "security group ids"
}
variable "instance2_name" {
  description = "name of the instance"
}
variable "associate_public_ip_address" {
  description = "associate_public_ip_address"
}

# AMI

variable "web_ami_name" {
  description = "web_ami_name"
}
variable "web_ami_description" {
  description = "web_ami_description"
}
variable "architecture" {
  description = "architecture"
}
variable "virtualization_type" {
  description = "virtualization_type"
}
variable "root_device_name" {
  description = "root_device_name"
}
variable "device_name" {
  description = "device_name"
}
variable "delete_on_termination" {
  description = "delete_on_termination"
}
variable "app_ami_name" {
  description = "web_ami_name"
}
variable "app_ami_description" {
  description = "web_ami_description"
}
