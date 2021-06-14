variable "name" {
  description = "The Name of the EC2"
  type        = string
  default     = "Free Tier EC2"
}

variable "security_group_name" {
  description = "The Name of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "security_group_description" {
  description = "The Description of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "ami" {
  description = "The Amazon Machine Image"
  type        = string
  default     = "ami-04b9e92b5572fa0d1" # Ubuntu 18.04 LTS (64-bit x86)  Free Tier eligible
}

variable "instance_type" {
  description = "The EC2 Instance type"
  type        = string
  default     = "t2.micro" # Free Tier eligible
}

variable "vpc_id" {
  description = "The ID of the VPC"
  sensitive   = true
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the Public Subnet"
  sensitive   = true
  type        = string
}

variable "ssh_name" {
  description = "The SSH Key Name"
  type        = string
  default     = "free-tier-ec2-key"
}

variable "ssh_public" {
  description = "The local path to the SSH Public Key"
  sensitive   = true
  type        = string
}
variable "seed_data" {
  description = "The local path to the SSH Public Key"
  default     = ""
  type        = string
}
